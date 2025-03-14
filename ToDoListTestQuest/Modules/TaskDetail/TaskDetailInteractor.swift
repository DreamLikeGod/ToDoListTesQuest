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
    
    func updateTaskDetail(_ title: String?, _ description: String) {
        let newTask = taskInfoUpdate(title, description)
        presenter?.didUpdateTaskDetail(newTask)
    }
    
    func saveTask(_ title: String?, _ description: String) {
        let newTask = taskInfoUpdate(title, description)
        coreData.updateTask(to: newTask)
        presenter?.didSaveTask()
    }
    
    func taskInfoUpdate(_ title: String? = nil, _ description: String? = nil) -> ToDoTaskEntity {
        guard let taskUpdated = task else { return ToDoTaskEntity() }
        if let title = title {
            taskUpdated.title = title
        } else {
            taskUpdated.title = ""
        }
        if description != "Опиши задачу..." {
            taskUpdated.desc = description
        } else {
            taskUpdated.desc = ""
        }
        return taskUpdated
    }
    
}
