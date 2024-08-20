//
//  OnboardingView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-19.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedViewIndex = 0
    
    var tabColors = [Color(red: 111/255, green: 154/255, blue: 189/255), Color(red: 255/255, green: 98/255, blue: 74/255)]
    
    var body: some View {
        ZStack {
            Color(tabColors[selectedViewIndex])
            
            TabView(selection: $selectedViewIndex) {
                OnboardingPageView(description: "City Sights helps you find the best of the city!", color: tabColors[0]) {
                    
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                
                OnboardingPageView(mainTitle: "Discover your city", description: "We'll show you the best restaurants, venues, and more, based on your location.", buttonLabel: "Get Started!", color: tabColors[1]) {
                    
                    dismiss()
                }
                .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .secondary)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .secondary)
                }
                .padding(.bottom, 210)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
