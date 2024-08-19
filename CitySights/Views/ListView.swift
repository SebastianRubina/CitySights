//
//  ListView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessViewModel.self) private var businessViewModel
    var body: some View {
        List {
            ForEach(businessViewModel.businesses) { business in
                VStack(spacing: 20) {
                    HStack {
                        Image("list-placeholder-image")
                        VStack(alignment: .leading) {
                            Text(business.name ?? "Restaurant")
                                .bold()
                            Text(TextHelper.distanceAwayText(meters: business.distance ?? 0))
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        Image(ImageHelper.getRatingImageName(rating: business.rating ?? 0))
                    }
                    
                    Divider()
                }
                .onTapGesture {
                    businessViewModel.selectedBusiness = business
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    @Previewable @State var businessViewModel = BusinessViewModel()
    ListView()
        .environment(businessViewModel)
        .task {
            await businessViewModel.getBusinesses()
        }
}
