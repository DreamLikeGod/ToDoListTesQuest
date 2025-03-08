//
//  ToDoListPresenter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

class ToDoListPresenter: ToDoListPresenterProtocol {
    
    weak var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorProtocol?
    var router: ToDoListRouterProtocol?
    var iteractor: ToDoListInteractorProtocol?
    
}
