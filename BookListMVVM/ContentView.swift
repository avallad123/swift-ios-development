//
//  ContentView.swift
//  BookList
//
//  Created by Alan Valladares on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BookViewModel()
    
    // Alerts for the various functions
    @State var addAlert = false
    @State var deleteAlert = false
    @State var searchAlert = false
    @State var showPrevAlert = false
    @State var showNextAlert = false

    
    @State private var newTitle = ""
    @State private var newAuthor = ""
    @State private var newGenre = ""
    @State private var newPrice = ""
    
    @State var deleteBookTitle = ""
    
    @State var searchResults: Book?
    @State var searchBookTitle = ""
    
    @State private var editTitle = ""
    @State private var editAuthor = ""
    @State private var editGenre = ""
    @State private var editPrice = ""
    @State private var isEditing = false

    
    
    var body: some View {
        NavigationView{
            VStack {
                if !viewModel.booksMade.isEmpty {
                    let book = viewModel.booksMade[viewModel.currentBook]
                                
                    VStack(alignment: .center) {
                        Text("Title: \(book.title)").font(.title2)
                        Text("Author: \(book.author)").font(.subheadline)
                        Text("Genre: \(book.genre)").font(.subheadline)
                        Text("Price: $\(book.price, specifier: "%.2f")").font(.subheadline)
                        }
                        .padding()
                        } else {
                            Text("No books available").font(.headline)
                        }
            }
            .navigationTitle("Book List")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Delete"){
                        deleteAlert = true
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Add"){
                        addAlert = true
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Search"){
                        searchAlert = true
                    }
                }
                
                ToolbarItem(placement: .bottomBar){
                    HStack{
                        Button("Previous"){
                            if viewModel.currentBook > 0{
                                viewModel.prevBook()
                            } else{
                                showPrevAlert = true
                            }
                        }
                        
                        Button("Next"){
                            if viewModel.currentBook < viewModel.booksMade.count - 1{
                                viewModel.nextBook()
                            } else {
                                showNextAlert = true
                            }
                        }
                    }
                }
            }
            
            .alert("Add New Book", isPresented: $addAlert){
                VStack{
                    TextField("Title", text: $newTitle)
                    TextField("Author", text: $newAuthor)
                    TextField("Genre", text: $newGenre)
                    TextField("Price", text: $newPrice)
                }
                
                Button("Add"){
                    if let price = Double(newPrice){
                        viewModel.addBook(title:newTitle, author: newAuthor, genre: newGenre, price: price)
                        
                        newTitle = ""
                        newAuthor = ""
                        newGenre = ""
                        newPrice = ""
                    }
                }
            }
            
            .alert("Delete Book", isPresented: $deleteAlert){
                TextField("Enter Book Title", text: $deleteBookTitle)
                Button("Delete"){
                    viewModel.deleteBook(title: deleteBookTitle)
                    deleteBookTitle = ""
                }
                Button("Cancel", role: .cancel){}
            }
            
            .sheet(isPresented: $searchAlert) {
                SearchBookView(viewModel: viewModel, searchBookTitle: $searchBookTitle, isEditing: $isEditing, editTitle: $editTitle, editAuthor: $editAuthor, editGenre: $editGenre, editPrice: $editPrice)
            }
            
            .alert("Oops! No previous book", isPresented: $showPrevAlert) {
                Button("OK", role: .cancel) {}
            }

            .alert("Oops! No next book", isPresented: $showNextAlert) {
                Button("OK", role: .cancel) {}
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
