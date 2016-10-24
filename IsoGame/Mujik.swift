//
//  Mujik.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

class Mujik: Tower{
    
    init(position: CGPoint, direction: Direction){
        super.init(sprite: SKSpriteNode(imageNamed:"iso_3d_droid_e.png"), position: position, occupied: [1,1], cost: 5, attackspeed: 1.0, damage: 2, range: 600, attackModifier: AttackModifier.standard, attackType: AttackType.standard, projectile: ProjectileType.standard, direction: direction)
    }
}
