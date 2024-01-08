//
//  DashboardTileView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 25/8/2023.
//

import SwiftUI

struct DashboardTile: View {
    
    @State private var width = UIScreen.main.bounds.width

    let title: String
    let systemName: String

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: systemName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                
                
            
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(Font.custom("Montserrat", size: 24))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                HStack {
                    Text("Get Detail")
                    .font(
                    Font.custom("Montserrat", size: 16)
                    .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                .foregroundColor(.white)
                    Image(systemName: "arrow.forward")
                        .resizable()
                    .frame(width: 16, height: 16)
                    
                }
            }
        }
        .frame(width: width - 48)
        
        .background(RoundedRectangle(cornerRadius: 15)
            
            .visualEffect({ effect, proxy in
            effect.blur(radius: 0.5).opacity(0.2)
            }))
    }
        
}

#Preview {
    DashboardTile(title: "Daily Horoscope", systemName: "sparkles")
}
