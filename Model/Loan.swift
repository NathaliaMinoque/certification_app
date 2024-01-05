//
//  Loan.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import Foundation

struct Loan: Identifiable, Codable, Hashable {
    let id: Int
    var id_member: Int
    var borrowed_date: String
    var due_date: String
    var returned_date: String
    var loan_status: Int
//    var createdAt: Date
//    var updatedAt: Date
}

//struct LoanEntity: Identifiable, Codable, Hashable {
//    var id: Int
//    var id_member: String
//    var id_book: [String]
//}

struct LoanEntity: Identifiable, Codable {
    var id: Int
    var id_member: String
    var details: [LoanDetails]
}

struct LoanDetails: Codable {
    var id_book: String
}

