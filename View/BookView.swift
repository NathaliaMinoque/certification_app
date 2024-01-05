//
//  BookView.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import SwiftUI

struct BookView: View {
    @ObservedObject var bookViewModel = BookViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Text("List Barang")
                            .bold()
                        Spacer()
                        NavigationLink(destination: AddBookView()) {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.black)
                        }
                    }
                    .font(.title)
                    .padding()
                    
                    List(bookViewModel.listBook, id: \.id) { book in
                        NavigationLink(destination: DetailBookView()) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(book.title)
                                        .font(.headline)
                                        .foregroundColor(Color.black)
                                    Text("\(book.author), \(book.published_year)")
                                        .font(.footnote)
                                        .foregroundColor(Color.black)
                                }
                                Spacer()
                                Text("\(book.loan_status)")
                                    .font(.footnote)
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                    .onAppear {
                        bookViewModel.readBookAll()
                    }
                    
                    
                   
                    
                }
            }
        }
    }
}

#Preview {
    BookView()
}
