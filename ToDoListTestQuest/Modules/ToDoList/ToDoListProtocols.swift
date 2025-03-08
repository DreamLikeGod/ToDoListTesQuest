//
//  ToDoListProtocols.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

protocol ToDoListInteractorProtocol: AnyObject {
    
    var presenter: ToDoListPresenterProtocol? { get set }
    
}

protocol ToDoListRouterProtocol: AnyObject {
    
    var view: ToDoListViewProtocol? { get set }
    
}

protocol ToDoListPresenterProtocol: AnyObject {
    
    var view: ToDoListViewProtocol? { get set }
    var router: ToDoListRouterProtocol? { get set }
    var interactor: ToDoListInteractorProtocol? { get set }
    
}

protocol ToDoListViewProtocol: AnyObject {
    var presenter: ToDoListPresenterProtocol? { get set }
}
