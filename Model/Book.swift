//
//  Book.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import Foundation

struct Book: Identifiable, Codable, Hashable {
    let id: Int
    var title: String
    var author: String
    var published_year: String
    var loan_status: Int
//    var createdAt: Date
//    var updatedAt: Date
}
