//
//  MainView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
//        show tab view
        TabView {
            BookView()
                .tabItem {
                    Label("Catalogue", systemImage: "book")
                }
            MemberView()
                .tabItem {
                    Label("Member", systemImage: "person.3")
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
