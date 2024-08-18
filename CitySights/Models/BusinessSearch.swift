//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses: [Business]
    var region: Region
    var total: Int
}

struct Region: Decodable {
    var center: Coordinate?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}
