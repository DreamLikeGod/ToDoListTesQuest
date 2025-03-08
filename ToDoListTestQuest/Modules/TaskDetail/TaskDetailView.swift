//
//  TaskDetailView.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import UIKit

class TaskDetailView: UIViewController  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension TaskDetailView: TaskDetailViewProtocol {
    
    var presenter: ToDoListPresenterProtocol?
    
}
