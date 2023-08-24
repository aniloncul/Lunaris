//
//  DashboardTileView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 25/8/2023.
//

import SwiftUI

struct DashboardTileView: View {

    let title: String
    let systemName: String

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: systemName)
                .padding(.horizontal)
                .font(.largeTitle)
            Text(title)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).visualEffect({ effect, proxy in
            effect.blur(radius: 0.5).opacity(0.2)
        }))
    }
}
