//
//  TaskDetailRouter.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import UIKit

class TaskDetailRouter: TaskDetailRouterProtocol {
    
    static func createModule(with task: ToDoTaskEntity) -> TaskDetailView {
        return TaskDetailView()
    }
    
    
    
}
