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
    var currentTarget: DestroyableUnit?
    
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
    
    //Choose new target for the tower
    func aim(target: DestroyableUnit?){
        if  target != nil {
            let dist = distance(sprite.position, p2: target!.sprite.position)
            if range >= dist {
                currentTarget = target
            }
        }
    }
    
    //Generate new projectile towards target
    func attack() -> Projectile?{
        if currentTarget != nil{
            return Projectile(sprite: SKSpriteNode(imageNamed: "droid_e.png"), position: sprite.position , target: currentTarget!, missledBy: self, velocity: 500.0)
        }
        return nil
    }
    
    //Attack behavior of the tower
    func attackScript(projectiles: NSMutableArray, enemies: NSMutableArray){
        let attack = SKAction.run({
            if self.currentTarget==nil{ // has no target
                self.currentTarget = self.scan(enemies: enemies)} //look for it
            else {
                projectiles.add(self.attack())} //attack
        })
        let wait = SKAction.wait(forDuration: TimeInterval(attackSpeed))
        SKAction.repeatForever(SKAction.sequence([attack, wait]))
    }
    
    //Return closest unit
    func scan(enemies: NSMutableArray) -> DestroyableUnit?{
        var target: DestroyableUnit?
        var minDist = self.range
        for node in enemies{
            let enemy = node as! DestroyableUnit
            let dist = distance(self.sprite.position, p2: enemy.sprite.position)
            if dist < minDist{
                minDist = dist
                target = enemy
            }
        }
        return target
    }
}
