//
//  LoanViewModel.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import Foundation

class LoanViewModel: ObservableObject {
    var prefixURL: String = "http://127.0.0.1:8000/api/loan"
    @Published var listLoan: [Loan] = []
    @Published var loan: Loan = Loan(id: 0, id_member: 0, borrowed_date: "", due_date: "", returned_date: "", loan_status: 0)
    @Published var loanEntity: LoanEntity = LoanEntity(id: 0, id_member: "", details: [])
    @Published var selectedBooks: [Book] = [Book(id: 1, title: "", author: "", published_year: "", loan_status: 0)]
    
    func readBarangAll() {
        guard let url = URL(string: "\(prefixURL)/readAll") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([Loan].self, from: data)
                    //                            print(decodedResponse)
                    DispatchQueue.main.async {
                        self.listLoan = decodedResponse
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
    }
    
    
    func createLoan(idMember: String, book: [Book]){
        
       
        let idBook: [String] = book.map { String($0.id) }
        
//        let loanEntity = LoanEntity(id: 0,
//                                    id_member: idMember,
//                                    id_book: idBook)
//        print("loanentityyyyy \(loanEntity)")
        
//        let loanEntity = LoanEntity(id: 0,
//                                    id_member: idMember,
//                                    details: LoanDetails(id_book: idBook)
//        )
        
        let loanDetailsArray = idBook.map { LoanDetails(id_book: $0) }
        let loanEntity = LoanEntity(id: 0, id_member: idMember, details: loanDetailsArray)

        
        print(loanEntity)
        
        guard let url = URL(string: "\(prefixURL)/create") else {
            print("Not found url")
            return
        }
        
        do{
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(loanEntity)
            print(jsonData)
            
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
//                        let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
//                        print("Min",decodedResponse)
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
}
