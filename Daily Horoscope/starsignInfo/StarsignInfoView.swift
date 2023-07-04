//
//  StarsignInfoView.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 27/6/2023.
//

import Foundation
import SwiftUI
import SpriteKit

class ParticleScene: SKScene {

    override init(size: CGSize) {
        super.init(size: size)
        let particleEmitter = SKEmitterNode(fileNamed: "Bokeh")!
        particleEmitter.position.y = size.height / 2
        particleEmitter.position.x = size.width / 2
        addChild(particleEmitter)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

struct StarsignInfoView: View {

    @State private var offset: CGFloat = 0
    private var scene = ParticleScene(size: UIScreen.main.bounds.size)

    var body: some View {
        ZStack {
            Image(.starfield)
                .offset(x: 200 + offset * 0.06, y: 0)
                .layoutPriority(-1)

            Image(.starfield)
                .rotationEffect(.degrees(90))
                .offset(x: offset * 0.02, y: 0)
                .layoutPriority(-1)

            Image(.starfield)
                .rotationEffect(.degrees(180))
                .offset(x: offset * 0.1, y: 0)
                .layoutPriority(-1)

            SpriteView(scene: scene, options: [.allowsTransparency])
                .offset(x: offset * 0.02, y: 0)

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
            Text(starsign.rawValue)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    StarsignInfoView()
}
