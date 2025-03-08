//
//  CoreDataService.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import Foundation
import CoreData

final class CoreDataService {
    
    static let shared = CoreDataService()
    
    private init() {}
    
    private var context: NSManagedObjectContext {
        AppDelegate().persistentContainer.viewContext
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
    
    func createTask(from task: ToDoTaskEntity) {
        let newTask = ToDoTaskEntity(context: self.context)
        newTask.id = Int64(task.id)
        newTask.title = task.title
        newTask.desc = task.description
        newTask.completed = task.completed
        newTask.createdAt = task.createdAt
        self.saveContext()
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
        self.saveContext()
    }
    
    func deleteTask(_ task: ToDoTaskEntity) {
        self.context.delete(task)
        self.saveContext()
    }
    
}
