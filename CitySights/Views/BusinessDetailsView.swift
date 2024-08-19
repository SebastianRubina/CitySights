//
//  BusinessDetails.swift
//  CitySights
//
//  Created by Sebastián Rubina on 2024-08-18.
//

import SwiftUI

struct BusinessDetailsView: View {
    @Environment(BusinessViewModel.self) private var businessViewModel

    var body: some View {
        let business = businessViewModel.selectedBusiness
        VStack(spacing: 0) {
            ZStack(alignment: .trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 76)
                }
            }
            .frame(height: 164)
            
            ZStack(alignment: .leading) {
                if let isClosed = business?.isClosed {
                    Rectangle()
                        .foregroundStyle(isClosed == true ? .red : .green)
                
                Text(isClosed ? "Closed" : "Open")
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                }
            }
            .frame(height: 36)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(business?.name ?? "Business Name")
                            .font(.title)
                            .bold()
                            .padding(.bottom, 10)
                        
                        Text("\(business?.location?.address1 ?? "Address"), \(business?.location?.city ?? "City")")
                        Text("\(business?.location?.state ?? "ST"), \(business?.location?.zipCode ?? "ZIPCODE"), \(business?.location?.country ?? "Country")")
                        
                        Image(ImageHelper.getRatingImageName(rating: business?.rating ?? 0))
                            .padding(.top, 10)
                    }
                    .padding(.vertical, 36)
                    
                    VStack(spacing: 12) {
                        HStack {
                            Image(systemName: "phone")
                            Text(business?.displayPhone ?? "+1 (123)456-789")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "globe")
                            Text(business?.url ?? "restaurantpage.com")
                                .lineLimit(1)
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                        
                        Divider()
                        
                        HStack {
                            Image(systemName: "bubble.left.and.bubble.right")
                            Text("\(business?.reviewCount ?? 0) reviews")
                            Spacer()
                            Image(systemName: "arrow.right")
                        }
                    }
                    
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    @Previewable @State var businessViewModel = BusinessViewModel()
    BusinessDetailsView()
        .task {
            await businessViewModel.getBusinesses()
            businessViewModel.selectedBusiness = businessViewModel.businesses.first
        }
        .environment(businessViewModel)
}
