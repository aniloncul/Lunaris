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
            TabView {
                DashboardView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Dashboard")
                    }
                
                // Add more tabs with different views
                // Example:
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Second Tab")
                    }
            }
        }
    }
}


