//
//  ContentView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import SwiftUI

struct HomeView: View {
    @Environment(BusinessViewModel.self) var businessViewModel
    @State var selectedTab = "list"
    
    var body: some View {
        @Bindable var businessViewModel = businessViewModel
        VStack {
            HStack {
                TextField("What are you looking for?", text: $businessViewModel.query)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    // TODO: Implement Query
                } label: {
                    Text("Search")
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
            
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag("list")
                Text("Map")
                    .tag("map")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            switch selectedTab {
            case "list":
                ListView()
            case "map":
                MapView()
            default:
                Text("Nothing...")
            }
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
    @Previewable @State var businessViewModel = BusinessViewModel()
    HomeView()
        .environment(businessViewModel)
}
