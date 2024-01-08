//
//  LaunchScreenView.swift
//  Daily Horoscope
//
//  Created by Anıl Öncül on 7.01.2024.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            Image("lunaris logo")
                .resizable()
                .scaleEffect(CGSize(width: 0.44, height: 0.22))
            
                
            
                
            
        }.background(
            Image("background")
                .resizable()
                .scaledToFill())
        
    }
}

#Preview {
    LaunchScreenView()
}
