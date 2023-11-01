//
//  StreetFighterCharacter.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import Foundation

struct StreetFighter {
    var name: String
    var imageUrl: String
    var nationality: Country
    var pageUrl: String
//    
//    enum CodingKeys: String, CodingKey {
//        case name, imageUrl, nationality, pageUrl
//    }
//    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        
//        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
//        self.imageUrl = try values.decode(String.self, forKey: .imageUrl) 
//        let nationalityStr: String = try values.decode(String.self, forKey: .nationality) 
//        self.nationality = Country.getEnum(text: nationalityStr)
//        self.pageUrl = try values.decode(String.self, forKey: .pageUrl) 
//    }
}
