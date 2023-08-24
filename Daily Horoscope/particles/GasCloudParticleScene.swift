//
//  GasCloudParticleScene.swift
//  Daily Horoscope
//
//  Created by Beau Nouvelle on 25/8/2023.
//

import Foundation
import SpriteKit

class GasCloudParticleScene: SKScene {

    override init(size: CGSize) {
        super.init(size: size)
        let particleEmitter = SKEmitterNode(fileNamed: "GasCloud")!
        particleEmitter.position.y = size.height / 2
        particleEmitter.position.x = size.width / 2
        particleEmitter.advanceSimulationTime(20)
        addChild(particleEmitter)
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
