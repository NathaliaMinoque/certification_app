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
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack{
            //            TextField(selectedBarang.nama)
            //            Text(selectedBarang.nama)
            
            ModalHeader(title: "Create Book",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
                //                error handling null
                if bookViewModel.bookString.title != "" && bookViewModel.bookString.author != "" && bookViewModel.bookString.published_year != "" {
                    
                    bookViewModel.createBook(bookString: bookViewModel.bookString)
                    print(bookViewModel.bookString)
                    dismiss()
                }else{
                    //                        ALERT DATA MASIH KOSONG
                    showingAlert = true
                }
                
            })
            
            //            menampilkan form
            Form {
                Section(header: Text("Book Details")) {
                    TextField("Title", text: $bookViewModel.bookString.title)
                    TextField("Author", text: $bookViewModel.bookString.author)
                    TextField("Published Year", text: $bookViewModel.bookString.published_year)
                }
            }
            
            //                ALERT DATA KOSONG
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Could not save the data"),
                    message: Text("Please fill out all details"),
                    primaryButton: .destructive(Text("Discard")) {
                        print("Deleting...")
                        dismiss()
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}

#Preview {
    AddBookView()
}
