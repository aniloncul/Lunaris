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

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Image(starsign?.constellation ?? "")
                        .resizable()
                        .scaledToFit()
                        .offset(y: -100)
                    Spacer()
                }
                ScrollView(showsIndicators: false) {
                    Spacer()
                        .frame(height: 200)

                    NavigationLink(destination: DailyAffirmationView()) {
                        DashboardRow(title: "Daily Affirmation", subtitle: "Know what you should focus on!")
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal)

                    NavigationLink(destination: DailyHoroscopeView()) {
                        DashboardRow(title: "Daily Horoscope", subtitle: "See what's on for today!")
                    }
                    .buttonStyle(.plain)
                    .padding(.horizontal)

                    LazyHGrid(rows: [.init(.adaptive(minimum: 100, maximum: 300))]) {
                        Button(action: {
                            showStarsignInfo = true
                        }, label: {
                            DashboardTile(title: "Zodiac", systemName: "sparkles")
                        })

                        Button(action: {
                            showPaywall = true
                        }, label: {
                            DashboardTile(title: "Purchases", systemName: "dollarsign")
                        })
                    }
                }
            }
            .navigationTitle(Text("Dashboard"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showOnboarding = true
                    } label: {
                        Image(systemName: "moon.dust.circle.fill")
                    }
                }
            }
            .background(
                LinearGradient(colors: [.init(red: 0, green: 0, blue: 0.3), .init(red: 0.2, green: 0, blue: 0.3)], startPoint: .top, endPoint: .bottom)
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

}

#Preview {
    DashboardView()
}
