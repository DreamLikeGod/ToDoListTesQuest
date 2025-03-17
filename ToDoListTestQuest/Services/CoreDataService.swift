//
//  CoreDataService.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import Foundation
import CoreData

protocol iCoreDataService {
    func createTaskArray(from tasks: [TaskModel])
    func createTask() -> ToDoTaskEntity
    func fetchTasks() -> [ToDoTaskEntity]
    func updateTask(to task: ToDoTaskEntity)
    func deleteTask(_ task: ToDoTaskEntity)
}

final class CoreDataService: iCoreDataService {
    
    static let shared = CoreDataService()
    
    private init() {}
    
    private var context: NSManagedObjectContext {
        return AppDelegate.persistentContainer.viewContext
    }
    
    private func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Context saving error: \(error)")
            }
        }
    }
    
    func createTaskArray(from tasks: [TaskModel]) {
        tasks.forEach { task in
            let newTask = ToDoTaskEntity(context: self.context)
            newTask.id = Int64(task.id)
            newTask.title = task.title
            newTask.desc = task.desc
            newTask.completed = task.completed
            newTask.createdAt = task.createdAt
        }
        self.saveContext()
    }
    
    func createTask() -> ToDoTaskEntity {
        let newTask = ToDoTaskEntity(context: self.context)
        newTask.id = self.fetchTasks().last!.id
        newTask.title = ""
        newTask.desc = ""
        newTask.completed = false
        newTask.createdAt = Date()
        self.saveContext()
        return newTask
    }
    
    func fetchTasks() -> [ToDoTaskEntity] {
        let fetchRequest: NSFetchRequest<ToDoTaskEntity> = ToDoTaskEntity.fetchRequest()
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Fetching error: \(error)")
            return []
        }
    }
    
    func updateTask(to task: ToDoTaskEntity) {
        if task.managedObjectContext != nil {
            self.saveContext()
        }
    }
    
    func deleteTask(_ task: ToDoTaskEntity) {
        if task.managedObjectContext != nil {
            self.context.delete(task)
            self.saveContext()
        }
    }
    
}
