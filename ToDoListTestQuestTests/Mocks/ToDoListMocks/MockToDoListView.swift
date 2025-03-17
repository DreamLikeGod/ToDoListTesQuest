import UIKit
@testable import ToDoListTestQuest

class MockToDoListView: UIViewController, ToDoListViewProtocol {
    var presenter: ToDoListTestQuest.ToDoListPresenterProtocol?
    
    var invokedShowToDoList = false
    var invokedShowToDoListCount = 0
    var invokedShowToDoListTodos: [ToDoListTestQuest.ToDoTaskEntity]!
    func showToDoList(with todos: [ToDoListTestQuest.ToDoTaskEntity]) {
        invokedShowToDoList = true
        invokedShowToDoListCount += 1
        invokedShowToDoListTodos = todos
    }
    
    var invokedShowError = false
    var invokedShowErrorCount = 0
    var invokedShowErrorMessage: String!
    func showError(with message: String) {
        invokedShowError = true
        invokedShowErrorCount += 1
        invokedShowErrorMessage = message
    }
}
