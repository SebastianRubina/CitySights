//
//  ContentView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import SwiftUI

struct ContentView: View {
    var service = DataService()
    
    @State var query: String = ""
    @State var businesses = [Business]()
    @State var selectedBusiness: Business?
    
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
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
                ForEach(businesses) { business in
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
                            
                            Image("regular_\(round((business.rating ?? 0) * 2) / 2)")
                        }
                        
                        Divider()
                    }
                    .onTapGesture {
                        selectedBusiness = business
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
        }
        .task {
            businesses = await service.businessSearch()
        }
        .sheet(item: $selectedBusiness) {
            BusinessDetailsView(business: $0)
        }
    }
}

#Preview {
    ContentView()
}
