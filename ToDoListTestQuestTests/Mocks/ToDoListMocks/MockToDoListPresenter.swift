import Foundation
@testable import ToDoListTestQuest

class MockToDoListPresenter: ToDoListPresenterProtocol, ToDoListInteractorOutputProtocol {
    var view: ToDoListTestQuest.ToDoListViewProtocol?
    var router: ToDoListTestQuest.ToDoListRouterProtocol?
    var interactor: ToDoListTestQuest.ToDoListInteractorInputProtocol?
    
    var invokedViewWillAppear = false
    var invokedViewWillAppearCount = 0
    func viewWillAppear() {
        invokedViewWillAppear = true
        invokedViewWillAppearCount += 1
    }
    
    var invokedShowTodoDetail = false
    var invokedShowTodoDetailCount = 0
    var invokedShowTodoDetailTask: ToDoListTestQuest.ToDoTaskEntity!
    func showTodoDetail(_ todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedShowTodoDetail = true
        invokedShowTodoDetailCount += 1
        invokedShowTodoDetailTask = todo
    }
    
    var invokedAddTodo = false
    var invokedAddTodoCount = 0
    func addTodo() {
        invokedAddTodo = true
        invokedAddTodoCount += 1
    }
    
    
    var invokedToggleTaskCompleted = false
    var invokedToggleTaskCompletedCount = 0
    var invokedToggleTaskCompletedTask: ToDoListTestQuest.ToDoTaskEntity!
    func toggleTaskCompleted(_ todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedToggleTaskCompleted = true
        invokedToggleTaskCompletedCount += 1
        invokedToggleTaskCompletedTask = todo
    }
    
    var invokedRemoveTodo = false
    var invokedRemoveTodoCount = 0
    var invokedRemoveTodoTask: ToDoListTestQuest.ToDoTaskEntity!
    func removeTodo(_ todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedRemoveTodo = true
        invokedRemoveTodoCount += 1
        invokedRemoveTodoTask = todo
    }
    
    var invokedSearchTasks = false
    var invokedSearchTasksCount = 0
    var invokedSearchTaskText: String!
    func searchTasks(by text: String?) {
        invokedSearchTasks = true
        invokedSearchTasksCount += 1
        invokedSearchTaskText = text
    }
    
    var invokedDidAddTodo = false
    var invokedDidAddTodoCount = 0
    var invokedDidAddTodoTask: ToDoListTestQuest.ToDoTaskEntity!
    func didAddTodo(_ todo: ToDoListTestQuest.ToDoTaskEntity) {
        invokedDidAddTodo = true
        invokedDidAddTodoCount += 1
        invokedDidAddTodoTask = todo
    }
    
    var invokedDidRemoveTodo = false
    var invokedDidRemoveTodoCount = 0
    func didRemoveTodo() {
        invokedDidRemoveTodo = true
        invokedDidRemoveTodoCount += 1
    }
    
    var invokedDidRetrieveTodo = false
    var invokedDidRetrieveTodoCount = 0
    var invokedDidRetrieveTodoTodos: [ToDoListTestQuest.ToDoTaskEntity]!
    func didRetrieveTodos(_ todos: [ToDoListTestQuest.ToDoTaskEntity]) {
        invokedDidRetrieveTodo = true
        invokedDidRetrieveTodoCount += 1
        invokedDidRetrieveTodoTodos = todos
    }
    
    var invokedDidToggledTaskCompleted = false
    var invokedDidToggledTaskCompletedCount = 0
    func didToggledTaskCompleted() {
        invokedDidToggledTaskCompleted = true
        invokedDidToggledTaskCompletedCount += 1
    }
    
    var invokedDidSearchedTasks = false
    var invokedDidSearchedTasksCount = 0
    func didSearchedTasks() {
        invokedDidSearchedTasks = true
        invokedDidSearchedTasksCount += 1
    }
    
    var invokedOnError = false
    var invokedOnErrorCount = 0
    var invokedOnErrorMessage: String!
    func onError(message: String) {
        invokedOnError = true
        invokedOnErrorCount += 1
        invokedOnErrorMessage = message
    }
}
