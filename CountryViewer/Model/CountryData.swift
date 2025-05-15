//
//  CountryData.swift
//  CountryViewer
//
//  Created by Mohamad Hammoud on 14/05/2025.
//

import Foundation

struct CountryData: Codable {
    let name: Name
    let cca2: String
    let capital: [String]
    let currencies: [String: Currency]
    let flags: Flags
    let region: String
    let languages: [String: String]
}

struct Name: Codable {
    let common, official: String
}

struct Currency: Codable {
    let name, symbol: String
}

struct Flags: Codable {
    let png: String
}

struct Language: Codable {
    let eng, fra, ara: String
}
