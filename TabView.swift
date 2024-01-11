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
            
            StarsignInfoView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Birth Chart")
                }
            // Tab 2
           
            
            // Add more tabs as needed
        }
    }
}
