//
//  TabView.swift
//  Daily Horoscope
//
//  Created by Anıl Öncül on 7.01.2024.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            // Tab 1
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            // Tab 2
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Second Tab")
                }
            
            // Add more tabs as needed
        }
    }
}
