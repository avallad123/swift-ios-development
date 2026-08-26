//
//  FinanceViews.swift
//  hw1
//
//  Created by Alan Valladares on 3/6/25.
//

import SwiftUI

struct EnterDataView: View {
    @ObservedObject var viewModel: FinanceViewModel
    @State var income: String = ""
    @State var expenses: String = ""
    @State var selectedCategory: String = ""
    
    let categories = ["Food", "Entertainment", "Transportation", "Rent/Mortgage", "Miscellaneous"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Income & Expenses For Today")) {
                    TextField("Income in dollars", text: $income)
                    
                    TextField("Expenses in dollars", text: $expenses)
                    
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
                
                Section {
                    Button("Add Entry") {
                        if let incomeValue = Double(income), let expenseValue = Double(expenses) {
                            viewModel.addEntry(income: incomeValue, expenses: expenseValue, category: selectedCategory)
                            income = ""
                            expenses = ""
                        }
                    }
                }
            }
            .navigationTitle("Enter Data")
        }
    }
}

struct ActivityView: View {
    @ObservedObject var viewModel: FinanceViewModel

    var body: some View {
        NavigationView {
            List(viewModel.entries) { entry in
                VStack(alignment: .leading) {
                    Text(entry.date, style: .date)
                        .font(.headline)
                    
                    Text("Income: $\(entry.income, specifier: "%.2f")")
                    Text("Expenses: $\(entry.expenses, specifier: "%.2f")")
                    Text("Savings: $\(entry.savings, specifier: "%.2f")")
                        .foregroundColor(entry.savings >= 0 ? .green : .red)
                    Text("Category: \(entry.category)")
                }
            }
            .navigationTitle("Last 7 Days")
        }
    }
}

struct InsightsView: View {
    @ObservedObject var viewModel: FinanceViewModel

    var body: some View {
        VStack {
            Text("How Am I doing?")
                .font(.title)
                .bold()

            Text(viewModel.calculateInsights())
                .font(.headline)
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("How Am I Doing?")
    }
}
