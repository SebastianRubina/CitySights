//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import Foundation
import SwiftUI

@Observable
class BusinessViewModel {
    
    var service = DataService()
    
    var query: String = ""
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    func getBusinesses() async {
        businesses = await service.businessSearch()
    }
    
}
