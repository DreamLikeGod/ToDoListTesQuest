import Foundation
@testable import ToDoListTestQuest

class MockTaskDetailInteractor: TaskDetailInteractorInputProtocol {
   
    var presenter: ToDoListTestQuest.TaskDetailInteractorOutputProtocol?
    var task: ToDoListTestQuest.ToDoTaskEntity?
    
    var invokedInit = false
    var invokedInitCount = 0
    required init(task: ToDoListTestQuest.ToDoTaskEntity?) {
        invokedInit = true
        invokedInitCount += 1
        self.task = task
    }
    
    var invokedUpdateTaskDetail = false
    var invokedUpdateTaskDetailCount = 0
    func updateTaskDetail(_ title: String?, _ description: String) {
        invokedUpdateTaskDetail = true
        invokedUpdateTaskDetailCount += 1
        helperUpdateTaskDetail(title, description)
    }
    
    var invokedSaveTask = false
    var invokedSaveTaskCount = 0
    func saveTask(_ title: String?, _ description: String) {
        invokedSaveTask = true
        invokedSaveTaskCount += 1
        helperUpdateTaskDetail(title, description)
    }
    
    func helperUpdateTaskDetail(_ title: String? = nil, _ description: String) {
        self.task?.title = title
        self.task?.desc = description
    }
}
