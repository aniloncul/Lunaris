//
//  MeteorParticleScene.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 25/8/2023.
//

import Foundation
import SpriteKit

class MeteorParticleScene: SKScene {

    override init(size: CGSize) {
        super.init(size: size)
        let particleEmitter = SKEmitterNode(fileNamed: "Meteor")!
        particleEmitter.position.y = size.height
        particleEmitter.position.x = size.width / 2
        addChild(particleEmitter)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
