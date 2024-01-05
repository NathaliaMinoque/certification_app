//
//  ModalHeader.swift
//  TokoAnugrah
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 04/01/24.
//

import SwiftUI

struct ModalHeader: View {
    
    var title: String
    var leftButton: String = ""
    var rightButton: String = ""
    
//    @Binding var isDisabled: Bool
    
    var leftFunction: () -> Void = { }
    var rightFunction: () -> Void = { }
    
    var body: some View {
        //HEADER
        HStack (spacing: 0){
            Button(leftButton) {
                leftFunction()
            }
            .foregroundColor(Color.white)
            .font(.system(size: 17))
            
            Spacer()
            
            Text(title)
                .font(.system(size: 20, weight: .light))
            
            Spacer()
            
            Button(rightButton) {
                rightFunction()
            }
            .buttonStyle(.plain)
//            .disabled(isDisabled)
            .font(.system(size: 17))
        }
        .padding()
        
    }
}

//#Preview {
//    ModalHeader()
//}
