//
//  ToDoListRouter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

import UIKit

class ToDoListRouter: ToDoListRouterProtocol {
    
    static func createTodoListModule() -> ToDoListView {
        let view = ToDoListView()
        let presenter: ToDoListPresenterProtocol & ToDoListInteractorOutputProtocol = ToDoListPresenter()
        let interactor: ToDoListInteractorInputProtocol = ToDoListInteractor()
        let router = ToDoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func presentToDoDetailScreen(from view: ToDoListViewProtocol, for todo: ToDoTaskEntity) {
        guard let prevView = view as? UIViewController else { fatalError("Invalid view type") }
        
        let taskDetailView = TaskDetailRouter.createDetailModule(with: todo)
        
        prevView.navigationController?.pushViewController(taskDetailView, animated: true)
    }
    
}
