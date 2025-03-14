//
//  Date+Extension.swift
//  ToDoListTestQuest
//
//  Created by Егор Ершов on 13.03.2025.
//

import UIKit

extension Date {
    
    func formattedDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        return dateFormatter.string(from: self)
    }
    
}
