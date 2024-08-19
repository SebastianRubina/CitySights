//
//  ContentView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import SwiftUI

struct ContentView: View {
    @Environment(BusinessViewModel.self) var businessViewModel
    
    var body: some View {
        @Bindable var businessViewModel = businessViewModel
        VStack {
            HStack {
                TextField("What are you looking for?", text: $businessViewModel.query)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    // TODO: Implement Query
                } label: {
                    Text("Go")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
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
        .task {
            await businessViewModel.getBusinesses()
        }
        .sheet(item: $businessViewModel.selectedBusiness) { _ in
            BusinessDetailsView()
        }
    }
}

#Preview {
    ContentView()
}
