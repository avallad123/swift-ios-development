//
//  ContentView.swift
//  hw1
//
//  Created by Alan Valladares on 3/5/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = FinanceViewModel()

    var body: some View {
        TabView {
            EnterDataView(viewModel: viewModel)
                .tabItem {
                    Label("Enter Data", systemImage: "plus.circle")
                }

            ActivityView(viewModel: viewModel)
                .tabItem {
                    Label("Activity", systemImage: "list.bullet")
                }

            InsightsView(viewModel: viewModel)
                .tabItem {
                    Label("How am I doing?", systemImage: "chart.bar.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
