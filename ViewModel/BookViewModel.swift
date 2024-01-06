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
    @Published var bookString: BookString = BookString(id: "", title: "", author: "", published_year: "", loan_status: "")
    
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
                        print(self.listBookAvailable)
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
    }
    
    func updateBook(bookString: BookString) {
        let book = Book(id: Int(bookString.id) ?? 0,
                        title: bookString.title,
                        author: bookString.author,
                        published_year: bookString.published_year,
                        loan_status: Int(bookString.loan_status) ?? 0)
        
        print("book vm", book)
        
        guard let url = URL(string: "\(prefixURL)/update") else {
            return
        }
        
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(book)
            
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "PUT"
            request.httpBody = jsonData
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    // Handle HTTP request error
                    print("eror",error)
                } else if let data = data {
                    // Handle HTTP request response
//                    let decod
                    do{
                        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                        print("Min",decodedResponse)
                    }catch{
                        print("error decode")
                    }
                    
                    //                    //                            print(decodedResponse)
                    //                    DispatchQueue.main.async {
                    //                        self.barang = decodedResponseedResponse = try JSONDecoder().decode(Barang.self, from: data)
                                     
                    print("data")
                } else {
                    // Handle unexpected error
                    print("extra")
                }
            }
                task.resume()
        }
        catch{
            
        }
    }
    
    func createBook(bookString: BookString) {
        let book = Book(id: Int(bookString.id) ?? 0,
                        title: bookString.title,
                        author: bookString.author,
                        published_year: bookString.published_year,
                        loan_status: Int(bookString.loan_status) ?? 0)
        
        guard let url = URL(string: "\(prefixURL)/create") else {
            print("Not found url")
            return
        }
        
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(book)
            
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = jsonData
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    // Handle HTTP request error
                    print("eror",error)
                } else if let data = data {
                    // Handle HTTP request response
//                    let decod
                    do{
                        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                        print("Min",decodedResponse)
                    }catch{
                        print("error decode")
                    }
                    print("data")
                } else {
                    // Handle unexpected error
                    print("extra")
                }
            }
                task.resume()
        }
        catch{
            
        }
    }
    
    func deleteBook(idBook: Int) {
        var components = URLComponents(string: "\(prefixURL)/delete")!

        components.queryItems = [
            URLQueryItem(name: "id", value: "\(idBook)"),
            URLQueryItem(name: "id", value: "\(idBook)")
        ]

        guard let url = components.url else {
            return
            //throw URLError(.badURL)
        }
        
//        guard let url = URL(string: "http://127.0.0.1:8000/api/barang/delete?id=\(idBarang)") else {
//            return
//        }
//
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(idBook)
            
            var request = URLRequest(url: url)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "DELETE"
            request.httpBody = jsonData
            
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    // Handle HTTP request error
                    print("eror",error)
                } else if let data = data {
                    // Handle HTTP request response
//                    let decod
                    do{
                        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                        print("Min",decodedResponse)
                    }catch{
                        print("error decode")
                    }
                                     
                    print("data")
                } else {
                    // Handle unexpected error
                    print("extra")
                }
            }
                task.resume()
        }
        catch{
            
        }
        
    }
}

