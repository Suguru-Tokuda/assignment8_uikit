//
//  UserDataModel.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import Foundation

struct UserDataModel : Decodable {
    let page: Int
    let perPage, total, totalPages: Int
    let data: [User]
    let support: Support
    
    enum CodingKeys: String, CodingKey {
        case page,
             perPage = "per_page",
             total,
             totalPages = "total_pages",
             data,
             support
    }
}

struct User: Decodable {
    let id: Int
    let email, firstName, lastName, avatar: String
    
    var fullName: String {
       return "\(firstName) \(lastName)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id, 
            email,
             firstName = "first_name",
             lastName = "last_name",
             avatar
    }
    
    
}

struct Support: Decodable {
    let url, text: String
}
