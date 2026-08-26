//
//  ContentView.swift
//  lab5
//
//  Created by Alan Valladares on 3/16/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ParkViewModel()
    @State var showAddParkView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.parks) { park in
                    NavigationLink(destination: ParkDetailView(park: park)) {
                        HStack {
                            Image(park.imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                            VStack(alignment: .leading) {
                                Text(park.name)
                                    .font(.headline)
                                Text(park.location)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .onDelete(perform: viewModel.deletePark)
            }
            .navigationTitle("Favorite Parks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddParkView = true
                    } label: {
                        Label("Add Park", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showAddParkView) {
                AddParkView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
