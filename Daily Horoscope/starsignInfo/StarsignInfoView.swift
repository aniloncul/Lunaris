//
//  StarsignInfoView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 27/6/2023.
//

import Foundation
import SwiftUI
import SpriteKit

#warning("Create shaders")
#warning("Affirmation Widget")
#warning("A new API call to Chat GPT for affirmations. New ViewModel.")
#warning("Date on dashboard")
#warning("Current planet influences on dashboard.")
#warning("Moon phases on dashboard")

struct StarsignInfoView: View {

    @State private var offset: CGFloat = 0
    private var scene = ParticleScene(size: UIScreen.main.bounds.size)

    var body: some View {
        ZStack {
            Image(.starfield)
                .offset(x: 200 + offset * 0.06, y: 0)
                .layoutPriority(-1)

//            Image(.starfield)
//                .rotationEffect(.degrees(90))
//                .offset(x: offset * 0.02, y: 0)
//                .layoutPriority(-1)
//
//            Image(.starfield)
//                .rotationEffect(.degrees(180))
//                .offset(x: offset * 0.1, y: 0)
//                .layoutPriority(-1)

//            SpriteView(scene: scene, options: [.allowsTransparency])
//                .offset(x: offset * 0.02, y: 0)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Starsign.allCases) { starsign in
                        StarsignView(starsign: starsign)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
                .scrollTargetLayout()
                .overlay(
                    OffsetProxy()
                )
                .onPreferenceChange(OffsetKey.self) { offset in
                    self.offset = offset
                }
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .background(
            LinearGradient(colors: [.init(red: 0, green: 0, blue: 0.3), .init(red: 0.2, green: 0, blue: 0.3)], startPoint: .top, endPoint: .bottom)
        )
    }

}

struct OffsetProxy: View {
    var body: some View {
        GeometryReader { proxy in
            Color.clear
                .preference(key: OffsetKey.self, value: proxy.frame(in: .global).minX)
        }
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct StarsignView: View {

    let starsign: Starsign

    var body: some View {
        VStack {
            Spacer()
            Image(starsign.constellation)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 300, maxHeight: 300)
                .padding()
                .shadow(color: .white, radius: 20, x: 0, y: 0)
            Spacer()
            Text(starsign.rawValue.capitalized)
                .font(.custom("GillSans", size: 45))
                .frame(maxWidth: .infinity)
                .padding(.bottom)
        }
        .shadow(color: .white, radius: 10, x: 0, y: 0)
    }
}

#Preview {
    StarsignInfoView()
}
