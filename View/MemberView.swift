//
//  MemberView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 07/01/24.
//

import SwiftUI

struct MemberView: View {
    @ObservedObject var memberViewModel = MemberViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Text("Members")
                            .bold()
                        Spacer()
                        
//                        PINDAH ADD MEMBER VIEW
                        NavigationLink(destination: AddMemberView()) {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.blue)
                        }
                    }
                    .font(.title)
                    .padding()
                    
//                    MENAMPILKAN DAFTAR MEMBER
                    List(memberViewModel.listMember, id: \.id) { member in
                        NavigationLink(destination: DetailMemberView(selectedMember: member)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(member.name)
                                        .font(.headline)
                                        .foregroundColor(Color.black)
                                         Text(member.address)
                                        .font(.footnote)
                                        .foregroundColor(Color.black)
                                    Text(member.phone)
                                   .font(.footnote)
                                   .foregroundColor(Color.black)
                                }
                                
                            }
                        }
                    }
                    .onAppear {
//                        HIT API FUNCTION
                        memberViewModel.readMemberAll()
                    }
                    
                    
                   
                    
                }
            }
        }
    }
}


#Preview {
    MemberView()
}
