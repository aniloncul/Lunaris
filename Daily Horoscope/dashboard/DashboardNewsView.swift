//
//  DashboardNewsView.swift
//  Daily Horoscope
//
//  Created by Anıl Öncül on 7.01.2024.
//

import SwiftUI

struct DashboardNewsView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.white, lineWidth: 2)
            .foregroundStyle(.clear)
            .overlay(
                VStack {
                Image("picture_1")
                        .scaledToFill()
                Text("Retro is coming again!\nThis time’s Retro will be...")
                .font(Font.custom("Montserrat", size: 24))
                .foregroundColor(.white)
                
                HStack {
                    Text("See more")
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .font(
                            .system(
                                size: 16, weight: .bold
                            ));
                    Image(systemName: "arrow.forward")
                }
                .padding(12)
                
                
          }
            
                )
            .frame(width: 361, height: 361)
            
                     
        
        
    }
}

#Preview {
    DashboardNewsView()
}
