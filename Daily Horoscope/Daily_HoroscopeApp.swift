//
//  Daily_HoroscopeApp.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 19/6/2023.
//

import SwiftUI
import SwiftData

@main
struct Daily_HoroscopeApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LandingView()
            }
        }
    }
}

    
struct TabViewPage: View {
    @State private var isPremium: Bool = false
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Dashboard")
                }
            if isPremium {
                            StarsignInfoView()
                                .tabItem {
                                    Image(systemName: "star.fill")
                                    Text("Birth Chart")
                                }
                        } else {
                            PremiumHoroscopeView( isPremium: $isPremium)
                                .tabItem {
                                    Image(systemName: "star.fill")
                                    Text("Premium Horoscope")
                                }
                        }
            
            // Add more tabs with different views
            // Example:
            ProfileView(isPremium: isPremium)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Birth Chart")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

