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
            
            List(businesses) { business in
                Text(business.name ?? "")
            }
            .listStyle(.plain)
        }
        .padding()
        .task {
            businesses = await service.businessSearch()
        }

    }
}

#Preview {
    ContentView()
}
