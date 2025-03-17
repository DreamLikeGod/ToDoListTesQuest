//
//  ToDoListInteractor.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

class ToDoListInteractor: ToDoListInteractorInputProtocol {
    
    weak var presenter: ToDoListInteractorOutputProtocol?
    var networkService: iNetworkService = NetworkService.shared
    var coreDataService: iCoreDataService = CoreDataService.shared
    
    var filter: String? = nil

    func retrieveTodos() {
        let tasks = coreDataService.fetchTasks()
        if tasks.isEmpty {
            Task {
                do {
                    let container = try await networkService.fetchTodos()
                    coreDataService.createTaskArray(from: container)
                    await MainActor.run {
                        let result = filteringTasks(coreDataService.fetchTasks())
                        presenter?.didRetrieveTodos(result)
                    }
                } catch {
                    print("Fetching data error: \(error)")
                    await MainActor.run {
                        presenter?.onError(message: error.localizedDescription)
                    }
                }
            }
        } else {
            presenter?.didRetrieveTodos(filteringTasks(tasks))
        }
    }
    
    func createTodo() {
        let task = coreDataService.createTask()
        presenter?.didAddTodo(task)
    }
    
    func deleteTodo(_ todo: ToDoTaskEntity) {
        coreDataService.deleteTask(todo)
        presenter?.didRemoveTodo()
    }
    
    func toggleTaskCompleted(_ todo: ToDoTaskEntity) {
        todo.completed.toggle()
        coreDataService.updateTask(to: todo)
        presenter?.didToggledTaskCompleted()
    }
    
    func searchTasks(by text: String?) {
        if text == "" {
            filter = nil
        } else {
            filter = text
        }
        presenter?.didSearchedTasks()
    }
    
    func filteringTasks(_ tasks: [ToDoTaskEntity]) -> [ToDoTaskEntity] {
        guard let filter = self.filter else { return tasks }
        
        return tasks.filter {
            $0.title?.localizedCaseInsensitiveContains(filter) ?? false ||
            $0.desc?.localizedCaseInsensitiveContains(filter) ?? false
        }
        
    }
}
