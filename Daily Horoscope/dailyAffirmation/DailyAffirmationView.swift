//
//  DailyAffirmationView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 10/7/2023.
//

import Foundation
import SwiftUI

struct DailyAffirmationView: View {
    var body: some View {
        VStack {
            Text("Daily Affirmation View")
                .navigationTitle(Text("Daily Affirmation"))
        }
        .background(
            LinearGradient(colors: [.init(red: 0, green: 0, blue: 0.3), .init(red: 0.2, green: 0, blue: 0.3)], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    DailyAffirmationView()
}
