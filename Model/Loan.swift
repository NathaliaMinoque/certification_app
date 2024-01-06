//
//  Loan.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import Foundation

//model loan default
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

//model loan join member
struct LoanMember: Identifiable, Codable, Hashable {
    let id: Int
    var id_member: Int
    var borrowed_date: String
    var due_date: String
    var returned_date: String
    var loan_status: Int
    var name: String
    var address: String
    var phone: String
//    var createdAt: Date
//    var updatedAt: Date
}

//model loan string
struct LoanEntity: Identifiable, Codable {
    var id: Int
    var id_member: String
    var details: [LoanDetails]
}

struct LoanDetails: Codable {
    var id_book: String
}

