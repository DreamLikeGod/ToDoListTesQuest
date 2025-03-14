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
    
    func addTodo() {
        interactor?.createTodo()
    }
    
    func removeTodo(_ todo: ToDoTaskEntity) {
        interactor?.deleteTodo(todo)
    }
    
    func toggleTaskCompleted(_ todo: ToDoTaskEntity) {
        interactor?.toggleTaskCompleted(todo)
    }
    
    func searchTasks(by text: String?) {
        print("Search Presenter")
        interactor?.searchTasks(by: text)
    }
    
}

extension ToDoListPresenter: ToDoListInteractorOutputProtocol {
    
    func didAddTodo(_ todo: ToDoTaskEntity) {
        guard let view = view else { return }
        router?.presentToDoDetailScreen(from: view, for: todo)
    }
    
    func didRemoveTodo() {
        interactor?.retrieveTodos()
    }
    
    func didRetrieveTodos(_ todos: [ToDoTaskEntity]) {
        view?.showToDoList(with: todos)
    }
    
    func didToggledTaskCompleted() {
        interactor?.retrieveTodos()
    }
    
    func onError(message: String) {
        view?.showError(with: message)
    }
    
    func didSearchedTasks() {
        print("Search Interactor Output")
        interactor?.retrieveTodos()
    }
    
}
