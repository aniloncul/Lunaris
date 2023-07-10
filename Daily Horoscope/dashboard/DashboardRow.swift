//
//  DashboardRow.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 10/7/2023.
//

import Foundation
import SwiftUI

struct DashboardRow: View {

    let title: String
    let subtitle: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 15).visualEffect({ effect, proxy in
            effect.blur(radius: 0.5).opacity(0.2)
        }))
    }
}
