//
//  DetailLoanView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import SwiftUI

struct DetailLoanView: View {
    @ObservedObject var detailLoanViewModel = DetailLoanViewModel()
    @ObservedObject var loanViewModel = LoanViewModel()
    @Environment(\.dismiss) var dismiss
//    tangkap
    var selectedLoan: LoanMember
    
    var body: some View {
        VStack(alignment: .leading){
            ModalHeader(title: "Loan Details",
                        leftButton: "Back",
                        rightButton: "Returned",
                        leftFunction: {dismiss()},
                        rightFunction: {
                loanViewModel.updateLoan(idLoan: selectedLoan.id)
                dismiss()
            })
            
            HStack{
                VStack(alignment: .leading){
                    Text("Name")
                    Text("Address")
                    Text("Phone")
                    Text("Borrowed Date")
                    Text("Due Date")

                }
                Spacer()
                VStack(alignment: .leading){
                    Text(": \(selectedLoan.name)")
                    Text(": \(selectedLoan.address)")
                    Text(": \(selectedLoan.phone)")
                    Text(": \(selectedLoan.borrowed_date)")
                    Text(": \(selectedLoan.due_date)")
           
                }
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
            .padding(.bottom)
            
            ForEach(detailLoanViewModel.listDetailLoanEntity, id: \.self) { detail in
//                Text("\(detail.title), \(detail.published_year)")
                
                HStack(){
                    Image(systemName: "book.closed")
                        .foregroundStyle(Color.black)
                        .font(.title)
                        .padding(.trailing)
                    VStack(alignment: .leading){
                        Text("\(detail.title)")
                            .bold()
                        Text("\(detail.author), \(detail.published_year)")
                            .font(.callout)
                    }
                }
                .padding(.bottom)
            }
         
            Spacer()
            Button(action: {
                loanViewModel.deleteLoan(idLoan: selectedLoan.id)
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
            .padding(.bottom)
        }
        .padding()
        .onAppear {
            detailLoanViewModel.readDetailLoan(idLoan: selectedLoan.id)
        }
    }
}

//#Preview {
//    DetailLoanView(selectedLoan: LoanMember(id: 1, id_member: 1, borrowed_date: , due_date: <#T##String#>, returned_date: <#T##String#>, loan_status: <#T##Int#>, name: <#T##String#>, address: <#T##String#>, phone: <#T##String#>))
//}
