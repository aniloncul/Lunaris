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
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
