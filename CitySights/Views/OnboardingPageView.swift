//
//  OnboardingPageView.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-19.
//

import SwiftUI

struct OnboardingPageView: View {
    var mainTitle: String = "Welcome to City Sights!"
    var description: String
    var buttonLabel: String = "Continue"
    var color: Color
    var buttonAction: () -> Void
    
    var body: some View {
        ZStack {
            color
            
            VStack(spacing: 32) {
                Spacer()
                Spacer()
                
                Image("onboarding")
                
                VStack {
                    Text(mainTitle)
                        .font(.title)
                        .bold()
                    
                    Text(description)
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
                
                Button {
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundStyle(.white)
                            .frame(height: 50)
                        
                        Text(buttonLabel)
                            .foregroundStyle(.black)
                            .bold()
                    }
                    
                }
                .padding()
            }
            .foregroundStyle(.white)
            .padding(.bottom, 80)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingPageView(description: "City Sights helps you find the best of the city!", color: Color(red: 111/255, green: 154/255, blue: 189/255)) {
        //
    }
}
