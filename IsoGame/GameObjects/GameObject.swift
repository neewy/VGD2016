//  TileObject.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit
import SpriteKit

protocol TileObject {
    var tile:Tile {get}
}

class GameObject: TileObject {
    let tile: Tile
    
    var facing:Direction
    var action:Action
    
    var tileSprite2D:SKSpriteNode!
    var tileSpriteISO:SKSpriteNode!
    
    init(tile: Tile) {
        facing = Direction.e
        action = Action.idle
        self.tile = tile
    }
    
    func update() {
        if (self.tileSprite2D != nil) {
            self.tileSprite2D.texture = TextureDroid.sharedInstance.textures2D[self.action.rawValue]![self.facing.rawValue]
        }
        if (self.tileSpriteISO != nil) {
            self.tileSpriteISO.texture = TextureDroid.sharedInstance.texturesIso[self.action.rawValue]![self.facing.rawValue]
        }
    }
    
    
    
    func goTo(position: CGPoint) {
        // Adjust for the isometric tile anchor point offset
        var correctPosition = position + CGPoint(x: TILE_SIZE.width/2, y: -TILE_SIZE.height/2)
        
        // Adjust for the 2D hero tile anchor point offset
        correctPosition = correctPosition + CGPoint(x:-TILE_SIZE.width/2, y:-TILE_SIZE.height/2)
        
        //1
        let deltaY = correctPosition.y - tileSprite2D.position.y
        let deltaX = correctPosition.x - tileSprite2D.position.x
        
        //2
        let degrees = atan2(deltaX, deltaY) * (180.0 / CGFloat(M_PI))
        
        //3
        facing = degreesToDirection(degrees)
        //4
        update()
        
        let velocity = 100
        let time = TimeInterval(distance(correctPosition, p2: tileSprite2D.position)/CGFloat(velocity))
        tileSprite2D.removeAllActions()
        tileSprite2D.run(SKAction.move(to: correctPosition, duration: time))
    }

    
}
