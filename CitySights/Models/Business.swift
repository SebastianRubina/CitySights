//
//  Business.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import Foundation

struct Business: Decodable, Identifiable {
    let id: String
    let alias: String?
    let categories: [Category]?
    let coordinates: Coordinate?
    let displayPhone: String?
    let distance: Double?
    let imageUrl: String?
    let isClosed: Bool?
    let location: Location?
    let name: String?
    let phone: String?
    let price: String?
    let rating: Double?
    let reviewCount: Int?
    let url: String?
    
    enum CodingKeys: String, CodingKey {
        case id, alias, categories, coordinates, distance, location, name, phone, price, rating, url
        case displayPhone = "display_phone"
        case imageUrl = "image_url"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
    }
}

struct Category: Decodable {
    let alias: String?
    let title: String?
}

struct Location: Decodable {
    let address1: String?
    let address2: String?
    let address3: String?
    let city: String?
    let country: String?
    let displayAddress: [String]?
    let state: String?
    let zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country, state
        case displayAddress = "display_address"
        case zipCode = "zip_code"
    }
}
