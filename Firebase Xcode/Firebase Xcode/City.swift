//
//  City.swift
//  Firebase Xcode
//
//  Created by Kushagra Sinha on 07/04/25.
//

import Foundation

struct City: Codable {
    let name: String
    let state: String?
    let country: String?
    let population: Int64?
    
    enum CodingKeys: String, CodingKey {
        case name
        case state
        case country
        case population
    }
}
