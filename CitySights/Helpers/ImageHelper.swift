//
//  ImageHelper.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import Foundation

struct ImageHelper {
    static func getRatingImageName(rating: Double) -> String {
        return "regular_\(round(rating * 2) / 2)"
    }
}
