//
//  MapView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(BusinessViewModel.self) var businessViewModel
    
    @State var selectedBusinessId: String?
    
    var body: some View {
        
        Map(selection: $selectedBusinessId) {
            ForEach(businessViewModel.businesses) { business in
                Marker(business.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: business.coordinates?.latitude ?? 0, longitude: business.coordinates?.longitude ?? 0))
                    .tag(business.id)
            }
        }
        .onChange(of: selectedBusinessId) { _, _ in
            businessViewModel.selectedBusiness = businessViewModel.businesses.first(where: { $0.id == selectedBusinessId })
        }
    }
}

#Preview {
    @Previewable @State var businessViewModel = BusinessViewModel()

    MapView()
        .environment(businessViewModel)
        .task {
            await businessViewModel.getBusinesses()
        }
}
