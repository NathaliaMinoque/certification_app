//
//  MainView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BookView()
                .tabItem {
                    Label("Book", systemImage: "book")
                }
            
            LoanView()
                .tabItem {
                    Label("Loan", systemImage: "list.dash")
                }
        }
    }
}

#Preview {
    MainView()
}
