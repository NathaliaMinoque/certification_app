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
    @State var showingAlert: Bool = false
    
    var body: some View {
        VStack{
            ModalHeader(title: "Create Member",
                        leftButton: "Back",
                        rightButton: "Save",
                        leftFunction: {dismiss()},
                        rightFunction: {
                
                //                error handling null
                if memberViewModel.member.name != "" && memberViewModel.member.address != "" && memberViewModel.member.phone != "" {
                    
                    //               CALL FUNCTION HIT API BUAT MEMBER
                                    memberViewModel.createMember(member: memberViewModel.member)
                                    print(memberViewModel.member)
                                                dismiss()
                }else{
                    //                        ALERT DATA MASIH KOSONG
                    showingAlert = true
                }

            })
            
            Form {
//                TEXTFIELD UNTUK PENGISIAN DATA MEMBER BARU
                Section(header: Text("Member Details")) {
                    TextField("Name", text: $memberViewModel.member.name)
                    TextField("Address", text: $memberViewModel.member.address)
                    TextField("Phone", text: $memberViewModel.member.phone)
                }
            }
            
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
    AddMemberView()
}
