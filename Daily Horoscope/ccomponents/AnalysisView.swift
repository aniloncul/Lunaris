//
//  AnalysisView.swift
//  Daily Horoscope
//
//  Created by Anıl Öncül on 8.01.2024.
//

import SwiftUI

struct AnalysisView: View {
    let header: String
    let text1: String
    var body: some View {
        Text(header)
            .foregroundColor(.black)
            .fontWeight(.regular)
            .font(.system(size: 20,
                          weight: .regular
                     ))
            .frame(width: 300, alignment: .leading)
    Text("""
         \(text1)
         """)
    .frame(width: 300)
    .font(.system(size: 14,
                  weight: .regular
             ))
    .foregroundColor(Color(red:0,green:0, blue:0.5))
    }
}

#Preview {
    AnalysisView(header: "anan", text1: "baba")
}


                                                                                                
