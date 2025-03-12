//
//  ToDoListPresenter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

class ToDoListPresenter: ToDoListPresenterProtocol {
    
    weak var view: ToDoListViewProtocol?
    var interactor: ToDoListInteractorInputProtocol?
    var router: ToDoListRouterProtocol?
    
    func viewWillAppear() {
        interactor?.retrieveTodos()
    }
    
    func showTodoDetail(_ todo: ToDoTaskEntity) {
        guard let view = view else { return }
        router?.presentToDoDetailScreen(from: view, for: todo)
    }
    
    func addTodo(_ todo: ToDoTaskEntity) {
        interactor?.saveTodo(todo)
    }
    
    func removeTodo(_ todo: ToDoTaskEntity) {
        interactor?.deleteTodo(todo)
    }
    
}

extension ToDoListPresenter: ToDoListInteractorOutputProtocol {
    func didAddTodo(_ todo: ToDoTaskEntity) {
        interactor?.retrieveTodos()
    }
    
    func didRemoveTodo(_ todo: ToDoTaskEntity) {
        interactor?.retrieveTodos()
    }
    
    func didRetrieveTodos(_ todos: [ToDoTaskEntity]) {
        view?.showToDoList(with: todos)
    }
    
    func onError(message: String) {
        view?.showError(with: message)
    }
    
    
}
