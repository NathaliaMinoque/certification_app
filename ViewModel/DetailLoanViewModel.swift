//
//  DetailLoanViewModel.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 06/01/24.
//

import Foundation

class DetailLoanViewModel: ObservableObject {
    
    var prefixURL: String = "http://127.0.0.1:8000/api/detailLoan"
    @Published var listDetailLoanEntity: [DetailLoanEntity] = [DetailLoanEntity(id: 0, id_loan: 0, id_book: 0, title: "", author: "", published_year: "", loan_status: 0)]
    
//    get detail loan
    func readDetailLoan(idLoan: Int) {
//        self.listDetailLoanEntity = [DetailLoanEntity(id: 0, id_loan: 0, id_book: 0, title: "", author: "", published_year: "", loan_status: 0)]
        
        var components = URLComponents(string: "\(prefixURL)/read")!

        print(idLoan)
        components.queryItems = [
            URLQueryItem(name: "id", value: "\(idLoan)")
        ]

        guard let url = components.url else {
            return
            //throw URLError(.badURL)
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode([DetailLoanEntity].self, from: data)
                    //                            print(decodedResponse)
                    DispatchQueue.main.async {
                        self.listDetailLoanEntity = decodedResponse
                        print("INI LOAN ENTITY",self.listDetailLoanEntity)
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
        }.resume()
    }
}
