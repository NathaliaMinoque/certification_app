//
//  DetailMemberView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 07/01/24.
//

import SwiftUI

struct DetailMemberView: View {
    @ObservedObject var memberViewModel = MemberViewModel()
    @Environment(\.dismiss) var dismiss
//    tangkap
    var selectedMember: Member
    
    var body: some View {
        VStack{
            ModalHeader(title: "Edit Details",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
                
//                HIT API FUNC UPDATE MEMBER
                memberViewModel.updateMember(member: memberViewModel.member)
                print(memberViewModel.member)
                            dismiss()
            })
            
            Form {
                
//                MENAMPILKAN DATA MEMBER BERUPA TEXTFIELD
                Section(header: Text("Member Details")) {
                    Text("\(memberViewModel.member.id)")
                        .foregroundColor(.gray)
                    TextField("name", text: $memberViewModel.member.name)
                    TextField("address", text: $memberViewModel.member.address)
                    TextField("phone", text: $memberViewModel.member.phone)
                }
                
//                BUTTON DELETE MEMBER
                Button(action: {
                    memberViewModel.deleteMember(idMember: selectedMember.id)
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
//            HIT API FUNCTION
            memberViewModel.readMemberAll()

//            MAPPING UNTUK JADI STRING
            memberViewModel.member = Member(id: selectedMember.id,
                                            name: selectedMember.name,
                                            address: selectedMember.address,
                                            phone: selectedMember.phone)
        }
    }
}

//#Preview {
//    DetailMemberView()
//}
