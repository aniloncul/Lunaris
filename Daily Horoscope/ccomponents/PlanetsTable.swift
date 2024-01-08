//
//  PlanetsTable.swift
//  Daily Horoscope
//
//  Created by Anıl Öncül on 8.01.2024.
//

import SwiftUI

struct PlanetsTable: View {
    let planet: String
    let zodiac: String
    var body: some View {
        HStack(alignment: .center) {
            Text(planet)
                .foregroundColor(Color(red:0,green:0, blue:0.5))
                .font(.system(size: 14))
            
            Spacer()
            
            Text(zodiac)
                .foregroundColor(Color(red:0,green:0, blue:0.5))
                .font(.system(size: 14))
     }
        .frame(width: 300, alignment: .center)
    Divider()
        .foregroundColor(Color(red:0,green:0, blue:0.5))
        .frame(width: 300, height: 1, alignment: .center)
    .overlay(Color(red:0,green:0, blue:0.5))
    }
}

#Preview {
    PlanetsTable(planet: "sun", zodiac: "virgo")
}
