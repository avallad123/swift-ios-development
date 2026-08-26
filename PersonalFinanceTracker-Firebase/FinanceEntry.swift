//
//  FinanceEntry.swift
//  hw2
//
//  Created by Alan Valladares on 4/3/25.
//

import Foundation
import FirebaseFirestore

struct FinanceEntry: Identifiable {
    var id: String
    var date: Date
    var income: Double
    var expenses: Double
    var category: String
    var savings: Double
    
    init(date: Date = Date(), income: Double = 0, expenses: Double = 0,
         category: String = "", savings: Double = 0) {
        self.id = UUID().uuidString
        self.date = date
        self.income = income
        self.expenses = expenses
        self.category = category
        self.savings = savings
    }
    
    init(id: String, data: [String: Any]) {
        self.id = id
        self.date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
        self.income = data["income"] as? Double ?? 0
        self.expenses = data["expenses"] as? Double ?? 0
        self.category = data["category"] as? String ?? "Miscellaneous"
        self.savings = data["savings"] as? Double ?? 0
    }
    
    func toDict() -> [String: Any] {
        return [
            "date": Timestamp(date: date),
            "income": income,
            "expenses": expenses,
            "category": category,
            "savings": savings
        ]
    }
}
