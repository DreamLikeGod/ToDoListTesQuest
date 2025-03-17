import UIKit
@testable import ToDoListTestQuest

class MockTaskDetailRouter: TaskDetailRouterProtocol {
    
    static var invokedCreateDetailModule = false
    static var invokedCreateDetailModuleCount = 0
    static var invokedCreateDetailModuleTask: ToDoListTestQuest.ToDoTaskEntity!
    static var invokedCreateDetailModuleResult: ToDoListTestQuest.TaskDetailView!
    static func createDetailModule(with task: ToDoListTestQuest.ToDoTaskEntity) -> ToDoListTestQuest.TaskDetailView {
        self.invokedCreateDetailModule = true
        self.invokedCreateDetailModuleCount += 1
        self.invokedCreateDetailModuleTask = task
        return self.invokedCreateDetailModuleResult
    }
    
    var invokedDissmissDetailModule = false
    var invokedDissmissDetailModuleCount = 0
    var invokedDissmissDetailModuleParameters: ToDoListTestQuest.TaskDetailViewProtocol!
    func dissmissDetailModule(from view: ToDoListTestQuest.TaskDetailViewProtocol) {
        invokedDissmissDetailModule = true
        invokedDissmissDetailModuleCount += 1
        invokedDissmissDetailModuleParameters = view
    }
} 
