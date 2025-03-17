import UIKit
@testable import ToDoListTestQuest

class MockTaskDetailView: UIViewController, TaskDetailViewProtocol {
    
    var presenter: ToDoListTestQuest.TaskDetailPresenterProtocol?
    
    var invokedShowTaskDetail = false
    var invokedShowTaskDetailCount = 0
    var invokedShowTaskDetailTask: ToDoListTestQuest.ToDoTaskEntity!
    func showTaskDetail(_ from: ToDoListTestQuest.ToDoTaskEntity) {
        invokedShowTaskDetail = true
        invokedShowTaskDetailCount += 1
        invokedShowTaskDetailTask = from
    }
} 
