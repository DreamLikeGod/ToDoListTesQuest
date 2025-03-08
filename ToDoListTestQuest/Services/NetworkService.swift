//
//  NetworkService.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import Foundation

enum ApiType {
    
    case ToDos
    
    var baseUrl: String {
        switch self {
        case .ToDos:
            return "https://dummyjson.com"
        }
    }
    
    var headers: [String: String] {
        switch self {
        default: [:]
        }
    }
    
    var path: String {
        switch self {
        case .ToDos:
            "/todos"
        }
    }
    
    var request: URLRequest {
        let url = URL(string: path, relativeTo: URL(string: baseUrl))!
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        switch self {
        case .ToDos:
            request.httpMethod = "GET"
        }
        
        return request
    }
    
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func fetchTodos() async throws -> [TaskModel] {
        let request = ApiType.ToDos.request
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            let response = try JSONDecoder().decode(TaskResponse.self, from: data)
            print("✅ Successfully fetched \(response.tasks.count) todos")
            return response.tasks
        } catch {
            print("❌ Decoding error: \(error)")
            throw error
        }
    }
    
}
