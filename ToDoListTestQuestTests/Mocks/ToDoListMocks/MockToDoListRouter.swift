import UIKit
@testable import ToDoListTestQuest

class MockToDoListRouter: ToDoListRouterProtocol {
    
    static var invokedCreateTodoListModule = false
    static var invokedCreateTodoListModuleCount = 0
    static var invokedCreateTodoListModuleResult: ToDoListTestQuest.ToDoListView!
    static func createTodoListModule() -> ToDoListTestQuest.ToDoListView {
        invokedCreateTodoListModule = true
        invokedCreateTodoListModuleCount += 1
        return invokedCreateTodoListModuleResult
    }
    
    var invokedPresentToDoDetailScreen = false
    var invokedPresentToDoDetailScreenCount = 0
    var invokedPresentToDoDetailScreenTask: ToDoListTestQuest.ToDoTaskEntity!
    func presentToDoDetailScreen(from view: ToDoListTestQuest.ToDoListViewProtocol, for todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedPresentToDoDetailScreen = true
        invokedPresentToDoDetailScreenCount += 1
        invokedPresentToDoDetailScreenTask = todo
    }
}
