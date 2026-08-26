//
//  FinanceViewModel.swift
//  hw1
//
//  Created by Alan Valladares on 3/5/25.
//

import Foundation

struct FinanceEntry: Identifiable {
    let id = UUID()
    let date: Date
    var income: Double
    var expenses: Double
    var category: String
    var savings: Double
}

class FinanceViewModel: ObservableObject {
    @Published var entries: [FinanceEntry] = []

    func addEntry(income: Double, expenses: Double, category: String) {
        let savings = income - expenses
        let newEntry = FinanceEntry(date: Date(), income: income, expenses: expenses, category: category, savings: savings)
        
        // This keeps only the last 7 days
        entries.append(newEntry)
        if entries.count > 7 {
            entries.removeFirst()
        }
    }
    
    func calculateInsights() -> String {
        var totalIncome = 0.0
        var totalExpenses = 0.0
        var totalSavings = 0.0
        
        for entry in entries {
            totalIncome += entry.income
            totalExpenses += entry.expenses
            totalSavings += entry.savings
        }
        
        if totalIncome == 0 {
            return "No insights available."
        }

        let avgDailyIncome = totalIncome / 7
        let avgDailyExpenses = totalExpenses / 7
        let avgDailySavings = totalSavings / 7

        if avgDailyExpenses > 0.3 * avgDailyIncome {
            return "You are overspending!"
        } else if avgDailySavings >= 0.1 * avgDailyIncome && avgDailySavings <= 0.3 * avgDailyIncome {
            return "You have a balanced budget!"
        } else if avgDailySavings > 0.3 * avgDailyIncome {
            return "You are saving well!"
        } else {
            return "No insights available."
        }
    }
}
