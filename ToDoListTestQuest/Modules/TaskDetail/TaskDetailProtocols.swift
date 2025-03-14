//
//  TaskDetailProtocols.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

protocol TaskDetailViewProtocol: AnyObject {
    
    var presenter: TaskDetailPresenterProtocol? { get set }
    
    func showTaskDetail(_ from: ToDoTaskEntity)
}

protocol TaskDetailInteractorInputProtocol: AnyObject {
    
    var presenter: TaskDetailInteractorOutputProtocol? { get set }
    var task: ToDoTaskEntity? { get set }

    init(task: ToDoTaskEntity?)
    
    func updateTaskDetail(_ title: String?, _ description: String)
    func saveTask(_ title: String?, _ description: String)
    
}

protocol TaskDetailInteractorOutputProtocol: AnyObject {
    
    func didUpdateTaskDetail(_ task: ToDoTaskEntity)
    func didSaveTask()
    
}

protocol TaskDetailPresenterProtocol: AnyObject {
    
    var view: TaskDetailViewProtocol? { get set }
    var router: TaskDetailRouterProtocol? { get set }
    var interactor: TaskDetailInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func updateTask(_ title: String?, _ description: String)
    func exitFromScreen(_ title: String?, _ description: String)
    
}

protocol TaskDetailRouterProtocol: AnyObject {
    
    static func createDetailModule(with task: ToDoTaskEntity) -> TaskDetailView
    
    func dissmissDetailModule(from view: TaskDetailViewProtocol )
    
}
