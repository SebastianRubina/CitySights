//
//  ContentView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
