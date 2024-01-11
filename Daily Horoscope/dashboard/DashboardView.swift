//
//  DashboardView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 4/7/2023.
//

import Foundation
import SwiftUI
import StoreKit

struct DashboardView: View {
    
    @AppStorage("starsign") var starsign: Starsign?
    @State var showPaywall: Bool = false
    @State var showDailyHoroscope: Bool = false
    @State var showOnboarding: Bool = false
    @State var showStarsignInfo: Bool = false
    @State var currentDate: Date = Date()
    
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text(formatDate(currentDate))
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                                .multilineTextAlignment(.leading)
                                .font(
                                    .system(size: 40,
                                            weight: .thin
                                           )
                                )
                            
                            
                            Text("In the halls of zodiac academy, Destiny is written in the stars.")
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                                .multilineTextAlignment(.leading)
                                .italic()
                            
                            Spacer()
                                .frame(height: 8)
                            
                           
                            
                            
                            Text("Star News")
                                .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
                                .multilineTextAlignment(.leading)
                                .font(
                                    .system(size: 24,
                                            weight: .light
                                           )
                                )
                            
                            VStack(spacing: 48){
                                DashboardNewsView()
                                    .frame(alignment: .center)
                                    .padding(.leading, 14)
                                
                                DashboardNewsView()
                                    .frame(alignment: .center)
                                    .padding(.leading, 14)
                                
                                DashboardNewsView()
                                    .frame(alignment: .center)
                                    .padding(.leading, 14)
                            }
                        }
                        
                    }
                }
            }
            
            .toolbar {
                
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button {
                            showOnboarding = true
                        } label: {
                            Image(systemName: "moon.dust.circle.fill")
                                .resizable()
                                .frame(width:36, height:36)
                            
                        }
                        Spacer()
                            .frame(width: 24)
                    }
                }
            }
            .padding([.bottom, .top], 32)
            .background(
                Image("background")
                    .resizable()
                    .scaledToFill()
            )
            .sheet(isPresented: $showPaywall) {
                StoreView(ids: ["PremiumMonthly", "PremiumQuarterly"])
            }
            .sheet(isPresented: $showStarsignInfo) {
                StarsignInfoView()
            }
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
        .onAppear {
            showOnboarding = starsign == nil
        }
    }
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy" // You can customize the format as needed
        return formatter.string(from: date)
    }
    
}

#Preview {
    DashboardView()
}
