//
//  ToDoListView.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 07.03.2025.
//

import UIKit

class ToDoListView: UIViewController {
    
    var presenter: ToDoListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension ToDoListView: ToDoListViewProtocol {
    
    
    
}
