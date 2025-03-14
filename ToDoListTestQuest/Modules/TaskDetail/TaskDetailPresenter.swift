//
//  TaskDetailPresenter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

class TaskDetailPresenter: TaskDetailPresenterProtocol {
    
    weak var view: TaskDetailViewProtocol?
    var router: TaskDetailRouterProtocol?
    var interactor: TaskDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        if let task = interactor?.task {
            view?.showTaskDetail(task)
        }
    }
    
    func updateTask(_ title: String?, _ description: String) {
        interactor?.updateTaskDetail(title, description)
    }
    
    func exitFromScreen(_ title: String?, _ description: String) {
        interactor?.saveTask(title, description)
    }
    
}

extension TaskDetailPresenter: TaskDetailInteractorOutputProtocol {
    func didUpdateTaskDetail(_ task: ToDoTaskEntity) {
        view?.showTaskDetail(task)
    }
    
    func didSaveTask() {
        guard let prevVC = view else { return }
        router?.dissmissDetailModule(from: prevVC)
    }
    
}
