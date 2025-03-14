//
//  TaskDetailRouter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import UIKit

class TaskDetailRouter: TaskDetailRouterProtocol {
    
    static func createDetailModule(with task: ToDoTaskEntity) -> TaskDetailView {
        let view = TaskDetailView()
        let presenter: TaskDetailPresenterProtocol & TaskDetailInteractorOutputProtocol = TaskDetailPresenter()
        let interactor: TaskDetailInteractorInputProtocol = TaskDetailInteractor(task: task)
        let router = TaskDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func dissmissDetailModule(from view: TaskDetailViewProtocol) {
        guard let view = view as? UIViewController else { return }
        
        view.navigationController?.popViewController(animated: true)
    }
    
}
