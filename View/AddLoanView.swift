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
    @State var showingAlert: Bool = false
    //    @State var isLoan: Bool = false
    
    var body: some View {
        VStack{
            //            cek buku ada yang kosong tdk
            if bookViewModel.listBookAvailable.count == 0 {
                Text("No available book to loan").tag("n")
            }
            else{
                ModalHeader(title: "Create Loan",
                            leftButton: "Back",
                            rightButton: "Save",
                            leftFunction: {dismiss()},
                            rightFunction: {
                    
                    //                    isLoan = false
                    
                    print("idmembeeer",loanViewModel.loanEntity.id_member)
                    
                    
                    //                    for loan in loanViewModel.listLoanMember{
                    //                        if loan.id_member == Int(loanViewModel.loanEntity.id_member) {
                    //                            print("INI LOAN MEMBER", String(loan.id_member))
                    //                            isLoan = true
                    //                        }
                    //                        }
                    
                    //                    CEK APAKAH ADA ISI PINJAMAN
                    if loanViewModel.loanEntity.id_member != ""{
                        
                        //                        MASUKIN BUKU DAN DATA KE ARRAY STRING
                        for book in loanViewModel.selectedBooks {
                            selectedBooksString.append(String(book.id))
                        }
                        
                        //                        HIT API FUNCTION
                        loanViewModel.createLoan(idMember: loanViewModel.loanEntity.id_member, book: loanViewModel.selectedBooks)
                        
                        dismiss()
                        
                    }else{
                        //                        ALERT DATA MASIH KOSONG
                        showingAlert = true
                    }
                    
                })
                
                //                FORM ID MEMBER
                Form{
                    Section(header: Text("MEMBER")) {
                        TextField("ID Member", text: $loanViewModel.loanEntity.id_member)
                        
                    }
                    
                    //                    MENAMPILKAN DAFTAR BUKU YANG BISA DILOAN
                    Section(header: Text("Books")) {
                        
                        ForEach((0..<pickerCount), id: \.self) {index in
                            
                            Picker("Title", selection: $loanViewModel.selectedBooks[index]) {
                                ForEach(bookViewModel.listBookAvailable, id: \.self) { book in
                                    Text("\(book.title), \(book.published_year)").tag("")
                                }
                            }
                            
                        }
                        
                        //                        ADD BUKU LAIN
                        Button(action: {
                            pickerCount+=1
                            loanViewModel.selectedBooks.append(contentsOf: [Book(id: 0, title: "", author: "", published_year: "", loan_status: 0)])
                            //                                    print(loanViewModel.selectedBooks)
                        }, label: {
                            Text("Add")
                        })
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
                
                //                .alert(isPresented: $isLoan) {
                //                    Alert(
                //                        title: Text("You have already loaned"),
                //                        message: Text("Please return first"),
                //                        primaryButton: .destructive(Text("Discard")) {
                //                            print("Deleting...")
                //                            dismiss()
                //                        },
                //                        secondaryButton: .cancel()
                //                    )
                //                }
            }
            
        }
        .onAppear{
            //            HIT API FUNCTION
            bookViewModel.readBookByAvailability()
        }
        
    }
}

#Preview {
    AddLoanView()
}

