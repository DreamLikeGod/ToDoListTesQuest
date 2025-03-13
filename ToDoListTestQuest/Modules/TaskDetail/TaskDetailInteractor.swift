//
//  TaskDetail.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

class TaskDetailInteractor: TaskDetailInteractorInputProtocol {
    
    weak var presenter: TaskDetailInteractorOutputProtocol?
    var task: ToDoTaskEntity?
    let coreData = CoreDataService.shared
    
    required init(task: ToDoTaskEntity?) {
        self.task = task
    }
    
    func retrieveTask() {
        presenter?.didRetrieveTask(task)
    }
    
    func updateTaskDetail(_ title: String, _ description: String) {
        guard let task = task else { return }
        task.title = title
        task.desc = description
        coreData.updateTask(to: task)
        presenter?.didUpdateTaskDetail()
    }
    
}
