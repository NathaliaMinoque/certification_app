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
                        Text("List Loan")
                            .bold()
                        Spacer()
                        NavigationLink(destination: AddLoanView()) {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.black)
                        }
                    }
                    .font(.title)
                    .padding()
                    
                    List(loanViewModel.listLoan, id: \.id) { loan in
                        NavigationLink(destination: DetailBookView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(loan.id_member)")
                                        .font(.headline)
                                        .foregroundColor(Color.black)
                                    Text("\(loan.borrowed_date)")
                                        .font(.footnote)
                                        .foregroundColor(Color.black)
                                }
                                Spacer()
                                Text("\(loan.loan_status)")
                                    .font(.footnote)
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    .onAppear {
                        loanViewModel.readBarangAll()
                    }
                    
                    
                   
                    
                }
            }
        }
    }
}

#Preview {
    LoanView()
}
