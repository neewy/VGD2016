//
//  Unit.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

class Unit{
    let sprite: SKSpriteNode //Iso
    
    init(sprite: SKSpriteNode, position: CGPoint) {
        self.sprite = sprite
        self.sprite.position = position
    }
    
    deinit {
        sprite.removeFromParent()
    }
}
