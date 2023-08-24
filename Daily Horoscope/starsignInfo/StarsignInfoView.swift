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

// OPEN THESE TABS FOR WHEN DOING NOISE, anmd search for animated noise spritekit
// https://developer.apple.com/documentation/gameplaykit/gkbillownoisesource
// https://developer.apple.com/documentation/gameplaykit/gknoisemap

struct StarsignInfoView: View {

    @State private var offset: CGFloat = 0
    private let scene = MeteorParticleScene(size: UIScreen.main.bounds.size)
    private let gasCloudScene = GasCloudParticleScene(size: CGSize(width: 700, height: 700))

    var body: some View {
        ZStack {
            Image(.starfield)
                .offset(x: 200 + offset * 0.01, y: 0)
                .layoutPriority(-1)
                .opacity(0.3)
                .rotation3DEffect(.degrees((-UIScreen.main.bounds.width * 6 - offset) / CGFloat(-500)) , axis: (x: 0.0, y: 1.0, z: 0.0))

            Image(.starfield)
                .rotationEffect(.degrees(90))
                .offset(x: offset * 0.04, y: 0)
                .layoutPriority(-1)
                .rotation3DEffect(.degrees((-UIScreen.main.bounds.width * 6 - offset) / CGFloat(-200)) , axis: (x: 0.0, y: 1.0, z: 0.0))

            SpriteView(scene: scene, options: [.allowsTransparency])

            SpriteView(scene: gasCloudScene, options: [.allowsTransparency])
                .frame(width: 1800, height: 800)
                .offset(x: 500 + offset * 0.2, y: 0)
                .layoutPriority(-1)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Starsign.allCases) { starsign in
                        GeometryReader { proxy in
                            let minX = proxy.frame(in: .global).minX
                            StarsignView(starsign: starsign)
                                .frame(width: UIScreen.main.bounds.width)
                                .rotation3DEffect(.degrees(minX / -8), axis: (x: 0.0, y: 1.0, z: 0.0))
                        }
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
            #warning("Add Starsign Symbol here")

            Image(starsign.constellation)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 400, maxHeight: 300)
                .padding()
                .shadow(color: .white, radius: 20, x: 0, y: 0)
                .shadow(color: .white, radius: 10, x: 0, y: 0)

            Spacer()
            Text(starsign.rawValue.capitalized)
                .font(.custom("GillSans", size: 45))
                .frame(maxWidth: .infinity)
                .padding(.bottom)
                .shadow(color: .white, radius: 5, x: 0, y: 0)
            #warning("add starsign dates here")
        }
    }
}

#Preview {
    StarsignInfoView()
}
