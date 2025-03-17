import Foundation
@testable import ToDoListTestQuest

class MockTaskDetailInteractor: TaskDetailInteractorInputProtocol {
   
    var presenter: ToDoListTestQuest.TaskDetailInteractorOutputProtocol?
    var task: ToDoListTestQuest.ToDoTaskEntity?
    
    var invokedInit = false
    var invokedInitCount = 0
    var invokedInitTask: ToDoListTestQuest.ToDoTaskEntity!
    required init(task: ToDoListTestQuest.ToDoTaskEntity?) {
        invokedInit = true
        invokedInitCount += 1
        invokedInitTask = task
    }
    
    var invokedUpdateTaskDetail = false
    var invokedUpdateTaskDetailCount = 0
    var invokedUpdateTaskDetailParameters: (title: String?, description: String)!
    func updateTaskDetail(_ title: String?, _ description: String) {
        invokedUpdateTaskDetail = true
        invokedUpdateTaskDetailCount += 1
        invokedUpdateTaskDetailParameters.title = title
        invokedUpdateTaskDetailParameters.description = description
    }
    
    var invokedSaveTask = false
    var invokedSaveTaskCount = 0
    var invokedSaveTaskParameters: (title: String?, description: String)!
    func saveTask(_ title: String?, _ description: String) {
        invokedSaveTask = true
        invokedSaveTaskCount += 1
        invokedSaveTaskParameters.title = title
        invokedSaveTaskParameters.description = description
    }
} 
