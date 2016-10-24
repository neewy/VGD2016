//
//  Tower.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//
import UIKit
import SpriteKit

//Responsible for the state of the certain tower

class Tower: Building, Directed, Buffable{
    
    //Fixed Properties
    var direction: Direction
    var attackSpeed: CGFloat
    var damage: CGFloat
    var range: CGFloat
    var attackModifier: AttackModifier
    var attackType: AttackType
    var projectile: ProjectileType
    var currentTarget: Unit?
    
    init(sprite: SKSpriteNode, position: CGPoint, occupied: [Int], cost: Int, attackspeed: CGFloat, damage: CGFloat, range: CGFloat, attackModifier: AttackModifier, attackType: AttackType, projectile: ProjectileType, direction: Direction) {
        attackSpeed = attackspeed
        self.damage = damage
        self.range = range
        self.attackModifier = attackModifier
        self.attackType = attackType
        self.projectile = projectile
        self.direction = direction
        super.init(sprite: sprite, position: position, occupied: occupied, cost: cost)
    }
    
    func buff() {
        
    }
    
    func debuff() {
        
    }
    
    //Single attack of the tower

    func attack(target: DestroyableUnit){
//        if  target!=null
        let dist = distance(sprite.position, p2: target.sprite.position)
        if range >= dist {
            //Generate new projectile towards target
//            weak let proj = Projectile(sprite: SKSpriteNode(imageNamed: "droid_e.png"), target: target, missledBy: self, velocity: 500.0)
        } else{
            currentTarget = nil //target is too far
        }
//        }
    }
    
    func attackScript(){
        let attack = SKAction.run({
            if self.currentTarget==nil{
            let target = self.scan()
                self.attack(target: target!)}
        })
        let wait = SKAction.wait(forDuration: TimeInterval(attackSpeed))
        SKAction.repeatForever(SKAction.sequence([attack, wait]))
    }
    
    //return closest unit
    func scan() -> DestroyableUnit?{
        return nil
    }
    
    func playAnimation(animationType: AnimationType){
        
    }
    
    func update(){
        
    }
}
