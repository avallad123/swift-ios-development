//
//  FinanceViews.swift
//  hw2
//
//  Created by Alan Valladares on 4/3/25.
//

import SwiftUI

struct EnterDataView: View {
    @ObservedObject var viewModel: FinanceViewModel
    @State var income: String = ""
    @State var expenses: String = ""
    @State var selectedCategory: String = ""
    @State var entryDate: Date = Date()
    
    let categories = ["Food", "Entertainment", "Transportation", "Rent/Mortgage", "Miscellaneous"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter Income & Expenses")) {
                    DatePicker("Date", selection: $entryDate, displayedComponents: .date)
                    TextField("Income in Dollars", text: $income)
                    TextField("Expenses in Dollars", text: $expenses)
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
                
                Section {
                    if viewModel.isLoading {
                        ProgressView()
                            
                    } else {
                        Button(action: saveEntry) {
                            Text("Save Entry")
                        }
                    }
                }
            }
            .navigationTitle("New Entry")
            .alert("Error", isPresented: .constant(!viewModel.alertMessage.isEmpty)) {
                Button("OK", role: .cancel) {
                    viewModel.alertMessage = ""
                }
            } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
    
    
    func saveEntry() {
        guard let incomeValue = Double(income),
              let expensesValue = Double(expenses) else {
            viewModel.alertMessage = "Please enter valid numbers"
            return
        }
        
        viewModel.addEntry(
            income: incomeValue,
            expenses: expensesValue,
            category: selectedCategory,
            date: entryDate
        )
        
        income = ""
        expenses = ""
        selectedCategory = ""
    }
}

struct ActivityView: View {
    @ObservedObject var viewModel: FinanceViewModel

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading && viewModel.entries.isEmpty {
                    ProgressView()
                } else if viewModel.entries.isEmpty {
                    Text("No entries yet")
                } else {
                    List(viewModel.entries) { entry in
                        VStack(alignment: .leading) {
                            Text(entry.date, style: .date)
                                .font(.headline)
                            HStack {
                                Text("Income: $\(entry.income, specifier: "%.2f")")
                                Spacer()
                                Text("Expenses: $\(entry.expenses, specifier: "%.2f")")
                            }
                            Text("Category: \(entry.category)")
                            Text("Savings: $\(entry.savings, specifier: "%.2f")")
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Recent Activity")
        }
    }
}

struct InsightsView: View {
    @ObservedObject var viewModel: FinanceViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                if viewModel.isLoading && viewModel.entries.isEmpty {
                    ProgressView()
                } else if viewModel.entries.isEmpty {
                    Text("Add entries to see insights")
                } else {
                    VStack(spacing: 16) {
                        Text(viewModel.calculateInsights())
                            .padding()
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("7 Day Summary:")
                                .font(.headline)
                            HStack {
                                Text("Total Income:")
                                Spacer()
                                Text("$\(viewModel.entries.reduce(0) { $0 + $1.income }, specifier: "%.2f")")
                            }
                            HStack {
                                Text("Total Expenses:")
                                Spacer()
                                Text("$\(viewModel.entries.reduce(0) { $0 + $1.expenses }, specifier: "%.2f")")
                            }
                            HStack {
                                Text("Savings:")
                                Spacer()
                                Text("$\(viewModel.entries.reduce(0) { $0 + $1.savings }, specifier: "%.2f")")
                            }
                        }
                        .padding()
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("How am I Doing?")
        }
    }
}
