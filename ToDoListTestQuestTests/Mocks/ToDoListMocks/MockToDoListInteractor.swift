import Foundation
@testable import ToDoListTestQuest

class MockToDoListInteractor: ToDoListInteractorInputProtocol {
    
    var presenter: ToDoListTestQuest.ToDoListInteractorOutputProtocol?
    
    var invokedRetrieveTodos = false
    var invokedRetrieveTodosCount = 0
    func retrieveTodos() {
        invokedRetrieveTodos = true
        invokedRetrieveTodosCount += 1
    }
    
    var invokedCreateTodo = false
    var invokedCreateTodoCount = 0
    func createTodo() {
        invokedCreateTodo = true
        invokedCreateTodoCount += 1
    }
    
    var invokedToggleTaskCompleted = false
    var invokedToggleTaskCompletedCount = 0
    var invokedToggleTaskCompletedTodo: ToDoListTestQuest.ToDoTaskEntity!
    func toggleTaskCompleted(_ todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedToggleTaskCompleted = true
        invokedToggleTaskCompletedCount += 1
        invokedToggleTaskCompletedTodo = todo
    }
    
    var invokedSearchTasks = false
    var invokedSearchTasksCount = 0
    var invokedSearchTasksText: String!
    func searchTasks(by text: String?) {
        invokedSearchTasks = true
        invokedSearchTasksCount += 1
        invokedSearchTasksText = text
    }
    
    var invokedDeleteTodo = false
    var invokedDeleteTodoCount = 0
    var invokedDeleteTodoTask: ToDoListTestQuest.ToDoTaskEntity!
    func deleteTodo(_ todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedDeleteTodo = true
        invokedDeleteTodoCount += 1
        invokedDeleteTodoTask = todo
    }
} 
