//
//  CitySightsApp.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-17.
//

import SwiftUI

@main
struct CitySightsApp: App {
    @State var businessViewModel = BusinessViewModel()
    @AppStorage("needsOnboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(businessViewModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
        }
    }
}
