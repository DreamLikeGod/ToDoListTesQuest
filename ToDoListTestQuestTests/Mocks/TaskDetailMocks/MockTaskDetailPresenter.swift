import Foundation
@testable import ToDoListTestQuest

class MockTaskDetailPresenter: TaskDetailPresenterProtocol, TaskDetailInteractorOutputProtocol {
    
    var view: ToDoListTestQuest.TaskDetailViewProtocol?
    var router: ToDoListTestQuest.TaskDetailRouterProtocol?
    var interactor: ToDoListTestQuest.TaskDetailInteractorInputProtocol?
    
    var invokedViewDidLoad = false
    var invokedViewDidLoadCount = 0
    func viewDidLoad() {
        invokedViewDidLoad = true
        invokedViewDidLoadCount += 1
    }
    
    var invokedUpdateTask = false
    var invokedUpdateTaskCount = 0
    var invokedUpdateTaskParameters: (title: String?, description: String)!
    func updateTask(_ title: String?, _ description: String) {
        invokedUpdateTask = true
        invokedUpdateTaskCount += 1
        invokedUpdateTaskParameters.title = title
        invokedUpdateTaskParameters.description = description
    }
    
    var invokedExitFromScreen = false
    var invokedExitFromScreenCount = 0
    var invokedExitFromScreenParameters: (title: String?, description: String)!
    func exitFromScreen(_ title: String?, _ description: String) {
        invokedExitFromScreen = true
        invokedExitFromScreenCount += 1
        invokedExitFromScreenParameters.title = title
        invokedExitFromScreenParameters.description = description
    }
    
    var invokedDidUpdateTaskDetail = false
    var invokedDidUpdateTaskDetailCount = 0
    var invokedDidUpdateTaskDetailTask: ToDoListTestQuest.ToDoTaskEntity!
    func didUpdateTaskDetail(_ task: ToDoListTestQuest.ToDoTaskEntity) {
        invokedDidUpdateTaskDetail = true
        invokedDidUpdateTaskDetailCount += 1
        invokedDidUpdateTaskDetailTask = task
    }
    
    var invokedDidSaveTask = false
    var invokedDidSaveTaskCount = 0
    func didSaveTask() {
        invokedDidSaveTask = true
        invokedDidSaveTaskCount += 1
    }
} 
