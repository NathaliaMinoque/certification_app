//
//  AddLoanView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import SwiftUI

struct AddLoanView: View {
    @StateObject var loanViewModel: LoanViewModel = LoanViewModel()
    @StateObject var bookViewModel: BookViewModel = BookViewModel()
    @Environment(\.dismiss) var dismiss
    @State var bookAvailable: [Book] = []
    @State var pickerCount: Int = 1
//    @State var selectedBooks: [Book] = []
    @State var selectedBooksString: [String] = []
    
    var body: some View {
        VStack{
            ModalHeader(title: "Add Loan",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
                
//                ForEach(selectedBooks) { book in
//                    let selectedBooksString: [String] = selectedBooks.map { String($0.id) }
//                }
                for book in loanViewModel.selectedBooks {
                    selectedBooksString.append(String(book.id))
                }
                
                loanViewModel.createLoan(idMember: loanViewModel.loanEntity.id_member, book: loanViewModel.selectedBooks)
                
                dismiss()
            })
            
            Form{
                Section(header: Text("MEMBER")) {
                    TextField("ID Member", text: $loanViewModel.loanEntity.id_member)
                    //                                TextField("book", text: $loanViewModel.)
                    
                    //                                ForEach((0..<pickerCount), id: \.self) {_ in
                    //                                    Picker("ID Member", selection: $selectedBook) {
                    //                                        ForEach(colors, id: \.self) {
                    //                                            Text($0)
                    //                                        }
                    //                                    }
                    //                                }
                    
                }
                
                Section(header: Text("Books")) {
                    ForEach((0..<pickerCount), id: \.self) {index in
//                 selectedBooks.append(contentsOf: [Book(id: 0, title: "", author: "", published_year: "", loan_status: 0)])
                        
                        //                        Picker("Title", selection: $selectedBooks[index]) {
                        //                                                              ForEach(bookViewModel.listAvailable, id: \.self) { book in
                        //                                                                  Text(book.title)
                        //                                                              }
                        //                                                          }
                        
                        Picker("Title", selection: $loanViewModel.selectedBooks[index]) {
                            ForEach(bookViewModel.listBookAvailable, id: \.self) { book in
                                Text(book.title).tag("")
                            }
                        }
                        
                        
                    }
                    Button(action: {
                        pickerCount+=1
                        loanViewModel.selectedBooks.append(contentsOf: [Book(id: 0, title: "", author: "", published_year: "", loan_status: 0)])
                        //                                    print(loanViewModel.selectedBooks)
                    }, label: {
                        Text("Add")
                    })
                }
            }
            .onAppear{
                bookViewModel.readBookByAvailability()
            }
            
        }
        
    }
}

#Preview {
    AddLoanView()
}

