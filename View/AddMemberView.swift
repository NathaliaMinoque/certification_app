//
//  AddMemberView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 07/01/24.
//

import SwiftUI

struct AddMemberView: View {
    @ObservedObject var memberViewModel = MemberViewModel()
    @Environment(\.dismiss) var dismiss
//    tangkap
//    var selectedBook: Book
    
    var body: some View {
        VStack{
            ModalHeader(title: "Create Member",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
//               CALL FUNCTION HIT API BUAT MEMBER
                memberViewModel.createMember(member: memberViewModel.member)
                print(memberViewModel.member)
                            dismiss()
            })
            
            Form {
//                TEXTFIELD UNTUK PENGISIAN DATA MEMBER BARU
                Section(header: Text("Member Details")) {
                    TextField("Name", text: $memberViewModel.member.name)
                    TextField("Address", text: $memberViewModel.member.address)
                    TextField("Phone", text: $memberViewModel.member.phone)
                }
            }
            
           
        }
    }
}

#Preview {
    AddMemberView()
}