//
//  Member.swift
//  Certification
//
//  Created by Nathalia Minoque Kusuma Salma Rasyid Jr. on 05/01/24.
//

import Foundation

//model member
struct Member: Identifiable, Codable, Hashable {
    let id: Int
    var name: String
    var address: String
    var phone: String
//    var createdAt: Date
//    var updatedAt: Date
}
