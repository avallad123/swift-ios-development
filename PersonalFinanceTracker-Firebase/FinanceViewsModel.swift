//
//  FinanceViewsModel.swift
//  hw2
//
//  Created by Alan Valladares on 4/3/25.
//

import FirebaseFirestore

class FinanceViewModel: ObservableObject {
    @Published var entries: [FinanceEntry] = []
    @Published var isLoading = false
    @Published var alertMessage = ""
    
    let db = Firestore.firestore()
    let collectionName = "financialEntries"

    init() {
        fetchEntries()
    }

    func addEntry(income: Double, expenses: Double, category: String, date: Date) {
        let savings = income - expenses
        let newEntry = FinanceEntry(
            date: date,
            income: income,
            expenses: expenses,
            category: category,
            savings: savings
        )

        isLoading = true
        db.collection(collectionName).document(newEntry.id).setData(newEntry.toDict()) { error in
            self.isLoading = false
            if let error = error {
                self.alertMessage = "Save failed: \(error.localizedDescription)"
            } else {
                self.fetchEntries()
            }
        }
    }

    func fetchEntries() {
        isLoading = true
        db.collection(collectionName)
            .order(by: "date", descending: true)
            .limit(to: 7)
            .getDocuments { snapshot, error in
                self.isLoading = false
                if let error = error {
                    self.alertMessage = "Load failed: \(error.localizedDescription)"
                    return
                }
                
                self.entries = snapshot?.documents.map { doc in
                    FinanceEntry(id: doc.documentID, data: doc.data())
                } ?? []
            }
    }
    
    func calculateInsights() -> String {
        guard !entries.isEmpty else { return "No data available" }
        
        var totalIncome = 0.0
        var totalExpenses = 0.0
        
        for entry in entries {
            totalIncome += entry.income
            totalExpenses += entry.expenses
        }
        
        let avgDailyIncome = totalIncome / Double(entries.count)
        let avgDailyExpenses = totalExpenses / Double(entries.count)
        let expenseR = avgDailyExpenses / avgDailyIncome
        
        if avgDailyExpenses > 0.3 * avgDailyIncome {
            return "You are overspending!"
        } else if expenseR >= 0.1 && expenseR <= 0.3 {
            return "You have a balanced budget!"
        } else {
            return "You are saving well!"
        }
    }
}
