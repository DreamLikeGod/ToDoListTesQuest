//
//  ToDoListProtocols.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//
import UIKit

protocol ToDoListViewProtocol: AnyObject {
    var presenter: ToDoListPresenterProtocol? { get set }
    
    func showToDoList(with todos: [ToDoTaskEntity])
    func showError(with message: String)
}

protocol ToDoListInteractorInputProtocol: AnyObject {
    
    var presenter: ToDoListInteractorOutputProtocol? { get set }
    
    func retrieveTodos()
    func createTodo()
    func toggleTaskCompleted(_ todo: ToDoTaskEntity)
    func searchTasks(by text: String?)
    func deleteTodo(_ todo: ToDoTaskEntity)
    
}

protocol ToDoListInteractorOutputProtocol: AnyObject {
    
    func didAddTodo(_ todo: ToDoTaskEntity)
    func didRemoveTodo()
    func didRetrieveTodos(_ todos: [ToDoTaskEntity])
    func didToggledTaskCompleted()
    func didSearchedTasks()
    func onError(message: String)
    
}

protocol ToDoListPresenterProtocol: AnyObject {
    
    var view: ToDoListViewProtocol? { get set }
    var router: ToDoListRouterProtocol? { get set }
    var interactor: ToDoListInteractorInputProtocol? { get set }
    
    func viewWillAppear()
    func showTodoDetail(_ todo: ToDoTaskEntity)
    func addTodo()
    func toggleTaskCompleted(_ todo: ToDoTaskEntity)
    func removeTodo(_ todo: ToDoTaskEntity)
    func searchTasks(by text: String?)
    
}

protocol ToDoListRouterProtocol: AnyObject {
    
    static func createTodoListModule() -> ToDoListView
    
    func presentToDoDetailScreen(from view: ToDoListViewProtocol, for todo: ToDoTaskEntity)
    
}


