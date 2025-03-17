//
//  TaskModel.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 08.03.2025.
//

import Foundation

struct TaskResponse: Codable {
    var tasks: [TaskModel]
    
    enum CodingKeys: String, CodingKey {
        case tasks = "todos"
    }
}

struct TaskModel: Codable, Equatable {
    let id: Int
    var title: String
    var completed: Bool
    var desc: String
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "todo"
        case completed
        case desc
        case createdAt
    }
    
    init(id: Int, title: String, description: String, completed: Bool, createdAt: Date) {
        self.id = id
        self.title = title
        self.desc = description
        self.completed = completed
        self.createdAt = createdAt
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        completed = try container.decode(Bool.self, forKey: .completed)
        desc = "Placeholder for description of task #\(id)"
        createdAt = Date()
    }
    
    static func == (lhs: TaskModel, rhs: TaskModel) -> Bool {
        return lhs.id == rhs.id && lhs.title == rhs.title && lhs.completed == rhs.completed && lhs.desc == rhs.desc && lhs.createdAt == rhs.createdAt
    }
    
}
