//
//  ToDoListInteractor.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

class ToDoListInteractor: ToDoListInteractorInputProtocol {
    
    weak var presenter: ToDoListInteractorOutputProtocol?
    var networkService = NetworkService.shared
    var coreDataService = CoreDataService.shared

    func retrieveTodos() {
        let tasks = coreDataService.fetchTasks()
        if tasks.isEmpty {
            Task {
                do {
                    let container = try await networkService.fetchTodos()
                    coreDataService.createTaskArray(from: container)
                    await MainActor.run {
                        presenter?.didRetrieveTodos(coreDataService.fetchTasks())
                    }
                } catch {
                    print("Fetching data error: \(error)")
                    await MainActor.run {
                        presenter?.onError(message: error.localizedDescription)
                    }
                }
            }
        } else {
            presenter?.didRetrieveTodos(tasks)
        }
    }
    
    func saveTodo(_ todo: ToDoTaskEntity) {
        coreDataService.createTask(from: todo)
        presenter?.didAddTodo(todo)
    }
    
    func deleteTodo(_ todo: ToDoTaskEntity) {
        coreDataService.deleteTask(todo)
        presenter?.didRemoveTodo(todo)
    }
    
}
