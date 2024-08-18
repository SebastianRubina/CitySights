//
//  TextHelper.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import Foundation

struct TextHelper {
    static func distanceAwayText(meters: Double) -> String {
        if meters > 1000 {
            return "\(Int(round(meters/1000)))km away"
        } else {
            return "\(Int(round(meters)))m away"
        }
    }
}
