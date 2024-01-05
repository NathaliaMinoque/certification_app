//
//  BookViewModel.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import Foundation

class BookViewModel: ObservableObject {
    var prefixURL: String = "http://127.0.0.1:8000/api/book"
    @Published var listBook: [Book] = []
    @Published var listIdBookAvailable: [String] = []
    @Published var listBookAvailable: [Book] = []
    @Published var book: Book = Book(id: 0, title: "", author: "", published_year: "", loan_status: 0)
    
    func readBookAll() {
        guard let url = URL(string: "\(prefixURL)/readAll") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Book].self, from: data)
                    //                            print(decodedResponse)
                    DispatchQueue.main.async {
                        self.listBook = decodedResponse
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
    }
    
    func readBookByAvailability() {
        guard let url = URL(string: "\(prefixURL)/readByAvailability") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Book].self, from: data)
                    //                            print(decodedResponse)
                    DispatchQueue.main.async {
                        self.listBookAvailable = decodedResponse
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
    }
}

