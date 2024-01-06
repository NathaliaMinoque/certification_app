//
//  LoanView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import SwiftUI

struct LoanView: View {
    @ObservedObject var loanViewModel = LoanViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Text("Active Loans")
                            .bold()
                        Spacer()
//                        pindah halaman add loan
                        NavigationLink(destination: AddLoanView()) {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.blue)
                        }
                    }
                    .font(.title)
                    .padding()
                    
//                    menampilan daftar loan yang aktif
                    List(loanViewModel.listLoanMember, id: \.id) { loan in
                        NavigationLink(destination: DetailLoanView(selectedLoan: loan)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(loan.name)")
                                        .font(.headline)
                                        .foregroundColor(Color.black)
                                    Text("Borrowed date: \(loan.borrowed_date)")
                                        .font(.footnote)
                                        .foregroundColor(Color.black)
                                    Text("Due date: \(loan.due_date)")
                                        .font(.footnote)
                                        .foregroundColor(Color.black)
                                }
                                Spacer()
                                
//                                menampilkan status loan
                                let status = loan.loan_status == 1 ? "Active" : "Inactive";
                                Text(status)
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                    .onAppear {
//                        hit api function
                        loanViewModel.readLoanAllMember()
                    }
                    
                    
                   
                    
                }
            }
        }
    }
}

#Preview {
    LoanView()
}
