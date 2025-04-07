//
//  Encodable+Dictionary.swift
//  Firebase Xcode
//
//  Created by Kushagra Sinha on 07/04/25.
//

import Foundation

extension Encodable {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        guard let dict = json as? [String: Any] else {
            throw NSError(domain: "Invalid Dictionary", code: -1)
        }
        return dict
    }
}
