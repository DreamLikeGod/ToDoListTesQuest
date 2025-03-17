//
//  CoreDataServiceMock.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 15.03.2025.
//

@testable import ToDoListTestQuest
import Foundation
import CoreData

final class CoreDataServiceMock: iCoreDataService {
    
    var invokedCreateTaskArray = false
    var invokedCreateTaskArrayCount = 0
    var invokedCreateTaskArrayTasks: [ToDoListTestQuest.TaskModel]!
    func createTaskArray(from tasks: [ToDoListTestQuest.TaskModel]) {
        invokedCreateTaskArray = true
        invokedCreateTaskArrayCount += 1
        invokedCreateTaskArrayTasks = tasks
    }
    
    var invokedCreateTask = false
    var invokedCreateTaskCount = 0
    var invokedCreateTaskResult: ToDoListTestQuest.ToDoTaskEntity!
    func createTask() -> ToDoListTestQuest.ToDoTaskEntity {
        invokedCreateTask = true
        invokedCreateTaskCount += 1
        return invokedCreateTaskResult
    }
    
    var invokedFetchTasks = false
    var invokedFetchTasksCount = 0
    var invokedFetchTasksResult: [ToDoListTestQuest.ToDoTaskEntity]!
    var invokedFetchTasksResultSaved: [ToDoListTestQuest.ToDoTaskEntity]!
    func fetchTasks() -> [ToDoListTestQuest.ToDoTaskEntity] {
        invokedFetchTasks = true
        invokedFetchTasksCount += 1
        return invokedFetchTasksCount > 1 ? invokedFetchTasksResultSaved : invokedFetchTasksResult
    }
    
    var invokedUpdateTask = false
    var invokedUpdateTaskCount = 0
    var invokedUpdateTaskTask: ToDoListTestQuest.ToDoTaskEntity!
    func updateTask(to task: ToDoListTestQuest.ToDoTaskEntity) {
        invokedUpdateTask = true
        invokedUpdateTaskCount += 1
        invokedUpdateTaskTask = task
    }
    
    var invokedDeleteTask = false
    var invokedDeleteTaskCount = 0
    var invokedDeleteTaskTask: ToDoListTestQuest.ToDoTaskEntity!
    func deleteTask(_ task: ToDoListTestQuest.ToDoTaskEntity) {
        invokedDeleteTask = true
        invokedDeleteTaskCount += 1
        invokedDeleteTaskTask = task
    }
    
    
}
