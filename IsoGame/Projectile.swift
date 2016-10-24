//
//  Projectile.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

class Projectile: Unit{
    let missledBy: Tower!
    weak var target: DestroyableUnit?
    let velocity: CGFloat
    let dt = 0.1 //TODO: transfer to GLOBAL
    
    init(sprite: SKSpriteNode, position: CGPoint, target: DestroyableUnit, missledBy: Tower, velocity: CGFloat) {
        self.missledBy = missledBy
        self.target = target
        self.velocity = velocity
        super.init(sprite: sprite, position: position)
        chase()
    }
    
    //chasing the target
    func chase(){
        sprite.run(SKAction.repeatForever(SKAction.move(to: target!.sprite.position, duration: Double(velocity)/dt)))
    }
    
    func applyDamage(){
        target!.applyDamage(damage: missledBy.damage, dmgType: missledBy.attackType)
        //play animation of death of projectile
    }
    
    deinit {
        sprite.removeFromParent()
    }
    
    
    
    
}
