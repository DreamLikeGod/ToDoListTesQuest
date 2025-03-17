//
//  NetworkServiceMock.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 15.03.2025.
//

@testable import ToDoListTestQuest
import Foundation

final class NetworkServiceMock: iNetworkService {
    
    var invokedFetchTodos = false
    var invokedFetchTodosCount = 0
    var invokedFetchTodosWithResult: [ToDoListTestQuest.TaskModel]!
    var invokedFetchTodosError: NSError!
    func fetchTodos() async throws -> [ToDoListTestQuest.TaskModel] {
        invokedFetchTodos = true
        invokedFetchTodosCount += 1
        if invokedFetchTodosWithResult.isEmpty {
            throw invokedFetchTodosError
        }
        return invokedFetchTodosWithResult
    }
    
}
