//
//  ToDoListView.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

import UIKit

class ToDoListView: UIViewController {
    
    var presenter: ToDoListPresenterProtocol?
    var tasks: [ToDoTaskEntity] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ToDoListViewTableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear()
    }
    
    func setupView() {
        title = "Задачи"
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
}

extension ToDoListView: ToDoListViewProtocol {
    
    func showToDoList(with todos: [ToDoTaskEntity]) {
        self.tasks = todos
    }
    
    func showError(with message: String) {
        print(message)
    }
    
}

extension ToDoListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        106
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoListViewTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setupCell(with: self.tasks[indexPath.row])
        
        return cell
    }
    
    
}
