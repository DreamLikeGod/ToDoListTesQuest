//
//  ToDoListRouter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

class ToDoListRouter: ToDoListRouterProtocol {
    
    weak var view: ToDoListViewProtocol?
    
    static func createModule() -> ToDoListView {
        let view = ToDoListView()
        let presenter = ToDoListPresenter()
        let interactor = ToDoListInteractor()
        let router = ToDoListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view
        
        return view
    }
    
    func navigateToTaskDetail(with task: ToDoTaskEntity) {
        let taskDetailView = TaskDetailRouter.createModule(with task: task)
    }
    
}
