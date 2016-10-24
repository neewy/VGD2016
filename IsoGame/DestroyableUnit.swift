//
//  DestroyableUnit.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

class DestroyableUnit: Unit, Destroyable{
    var hitPoints: CGFloat
    var armor: CGFloat
    
    func applyDamage(damage: CGFloat, dmgType: AttackType) {
        hitPoints -= damage*dmgType.factor
    }
    
    init(sprite: SKSpriteNode, position: CGPoint, hitPoints: CGFloat, armor: CGFloat = 0) {
        self.hitPoints = hitPoints
        self.armor = armor
        super.init(sprite: sprite, position: position)
    }
    
}
