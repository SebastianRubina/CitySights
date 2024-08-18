//
//  BusinessDetails.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import SwiftUI

struct BusinessDetailsView: View {
    var business: Business?
    
    var body: some View {
        Text(business?.name ?? "No name")
    }
}

#Preview {
    BusinessDetailsView()
}
