//
//  Country.swift
//  iOSBootcampUIKit
//
//  Created by Suguru Tokuda on 11/1/23.
//

import Foundation

enum Country : String, CaseIterable {
    case japan = "Japan",
         china = "China",
         hongKong = "HongKong",
         korea = "South Korea",
         us = "United States",
         uk = "United Kingdom",
         brazil = "Brazil",
         russia = "Russia",
         mexico = "Mexico",
         france = "France",
         italy = "Italy",
         india = "India",
         jamaica = "Jamaica",
         arab = "United Arab"
    
    static func getEnum(text: String) -> Country {
        switch text.lowercased() {
        case "japan":
            return .japan
        case "china":
            return .china
        case "hongkong":
            return .hongKong
        case "south korea":
            return .korea
        case "united states":
            return .us
        case "united kingdom":
            return .uk
        case "brazil":
            return .brazil
        case "russia":
            return .russia
        case "mexico":
            return .mexico
        case "france":
            return .france
        case "italy":
            return .italy
        case "india":
            return .india
        case "jamaica":
            return .jamaica
        case "united arab":
            return .arab
        default:
            return .japan
        }
    }
}
