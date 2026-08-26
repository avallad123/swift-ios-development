//
//  BookViewModel.swift
//  BookList
//
//  Created by Alan Valladares on 3/2/25.
//

import Foundation


class BookViewModel: ObservableObject{
    
    // This makes an empty list of books
    @Published var booksMade: [Book] = []
    @Published var currentBook: Int = 0
    
    func addBook(title: String, author: String, genre: String, price: Double){
        let newBook = Book(title: title, author: author, genre: genre, price: price)
        booksMade.append(newBook)
        
        if booksMade.count == 1{
            currentBook = 0
        }
    }
    
    func deleteBook(title: String) {
        if let index = booksMade.firstIndex(where: { book in
            book.title == title
        }) {
            booksMade.remove(at: index)
            
            if currentBook >= booksMade.count {
                currentBook = max(0, booksMade.count - 1)
            }
        }
    }
    
    func searchBook(title: String) -> Book? {
        return booksMade.first { book in
            book.title == title
        }
    }
    
    func editBook(){
        func editBook(originalTitle: String, newTitle: String, newAuthor: String, newGenre: String, newPrice: Double) {
            for (index, book) in booksMade.enumerated() {
                if book.title == originalTitle {
                    booksMade[index] = Book(title: newTitle, author: newAuthor, genre: newGenre, price: newPrice)
                    break
                }
            }
        }
    }
    
    func nextBook(){
        if currentBook < booksMade.count - 1{
            currentBook = currentBook + 1
        }
    }
    
    func prevBook(){
        if currentBook > 0{
            currentBook = currentBook - 1
        }
    }
    
    func editBook(originalTitle: String, newTitle: String, newAuthor: String, newGenre: String, newPrice: Double) {
        if let index = booksMade.firstIndex(where: { book in
            book.title == originalTitle
        }){
            booksMade[index] = Book(title: newTitle, author: newAuthor, genre: newGenre, price: newPrice)
        }
    }
}
