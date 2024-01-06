//
//  DetailBookView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import SwiftUI

struct DetailBookView: View {
    @ObservedObject var bookViewModel = BookViewModel()
    @Environment(\.dismiss) var dismiss
//    tangkap
    var selectedBook: Book
    
    var body: some View {
        VStack{
            //            TextField(selectedBarang.nama)
            //            Text(selectedBarang.nama)
            
            ModalHeader(title: "Book Details",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
                bookViewModel.updateBook(bookString: bookViewModel.bookString)
                print(bookViewModel.bookString)
                            dismiss()
            })
            
            Form {
                Section(header: Text("Book Details")) {
                    TextField("title", text: $bookViewModel.bookString.title)
                    TextField("author", text: $bookViewModel.bookString.author)
                    TextField("published_year", text: $bookViewModel.bookString.published_year)
                }
                
                Button(action: {
                    bookViewModel.deleteBook(idBook: selectedBook.id)
                    dismiss()
                }, label: {
                    HStack{
                        Spacer()
                        Text("Delete")
                        Spacer()
                    }
                })
                .buttonStyle(.borderless)
                .tint(.red)
            }
            
           
        }
        .onAppear {
            bookViewModel.readBookAll()
//            print("Selected Barang",selectedBarang)
            bookViewModel.bookString = BookString(id: String(selectedBook.id),
                                                  title: String(selectedBook.title),
                                                  author: String(selectedBook.author),
                                                  published_year: String(selectedBook.published_year),
                                                  loan_status: String(selectedBook.loan_status))
        }
    }
}

//#Preview {
//    DetailBookView(selectedBook: <#Book#>)
//}
