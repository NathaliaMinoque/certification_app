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
                        Text("Catalogue")
                            .bold()
                        Spacer()
                        NavigationLink(destination: AddBookView()) {
                            Image(systemName: "plus")
                                .foregroundStyle(Color.blue)
                        }
                    }
                    .font(.title)
                    .padding()
                    
                    List(bookViewModel.listBook, id: \.id) { book in
                        NavigationLink(destination: DetailBookView(selectedBook: book)) {
                            HStack {
                                Image(systemName: "book.closed")
                                    .foregroundStyle(Color.black)
                                    .font(.title)
                                    .padding(.trailing)
                                VStack(alignment: .leading) {
                                    Text(book.title)
                                        .font(.headline)
                                        .foregroundColor(Color.black)
                                    Text("\(book.author), \(book.published_year)")
                                        .font(.footnote)
                                        .foregroundColor(Color.black)
                                }
                                Spacer()
                                let status = book.loan_status == 0 ? "Available" : "Unavailable";
                                Text(status)
                                    .font(.footnote)
                                    .foregroundColor(Color.gray)
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
