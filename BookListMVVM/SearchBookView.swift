//
//  SearchBookView.swift
//  BookList
//
//  Created by Alan Valladares on 3/3/25.
//

import SwiftUI

struct SearchBookView: View {
    @ObservedObject var viewModel: BookViewModel
    
    @Binding var searchBookTitle: String
    @Binding var isEditing: Bool
    @Binding var editTitle: String
    @Binding var editAuthor: String
    @Binding var editGenre: String
    @Binding var editPrice: String

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Book Title", text: $searchBookTitle)
                    .padding()

                Button("Search") {
                    if let book = viewModel.searchBook(title: searchBookTitle) {
                        editTitle = book.title
                        editAuthor = book.author
                        editGenre = book.genre
                        editPrice = String(book.price)
                        isEditing = true
                    } else {
                        isEditing = false
                    }
                }
                .padding()

                if isEditing {
                    
                    Text("Edit book")
                    
                    VStack {
                        TextField("Title", text: $editTitle)
                        TextField("Author", text: $editAuthor)
                        TextField("Genre", text: $editGenre)
                        TextField("Price", text: $editPrice)

                        Button("Save Changes") {
                            if let newPrice = Double(editPrice) {
                                viewModel.editBook(originalTitle: searchBookTitle, newTitle: editTitle, newAuthor: editAuthor, newGenre: editGenre, newPrice: newPrice)
                                dismiss()
                            }
                        }
                        .padding()
                    }
                } else {
                    Text("Book Not Found")
                }

                Spacer()
            }
            .navigationTitle("Search and Edit Book")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Close") {
                        dismiss()
                    }
                }
            }
            .padding()
        }
    }
}
