//
//  StarsignParticleScene.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 25/8/2023.
//

import Foundation
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
