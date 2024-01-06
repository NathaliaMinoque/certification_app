//
//  AddBookView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import SwiftUI

struct AddBookView: View {
    
    @ObservedObject var bookViewModel = BookViewModel()
    @Environment(\.dismiss) var dismiss
//    tangkap
//    var selectedBook: Book
    
    var body: some View {
        VStack{
            //            TextField(selectedBarang.nama)
            //            Text(selectedBarang.nama)
            
            ModalHeader(title: "Create Book",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
                bookViewModel.createBook(bookString: bookViewModel.bookString)
                print(bookViewModel.bookString)
                            dismiss()
            })
            
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $bookViewModel.bookString.title)
                    TextField("Author", text: $bookViewModel.bookString.author)
                    TextField("Published Year", text: $bookViewModel.bookString.published_year)
                }
            }
            
           
        }
    }
}

#Preview {
    AddBookView()
}
