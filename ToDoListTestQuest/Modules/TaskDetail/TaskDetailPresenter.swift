//
//  TaskDetailPresenter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

class TaskDetailPresenter: TaskDetailPresenterProtocol {
    
    weak var view: ToDoListViewProtocol?
    var router: ToDoListRouterProtocol?
    var interactor: ToDoListInteractorProtocol?
    
}
