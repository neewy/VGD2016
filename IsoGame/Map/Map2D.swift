//
//  Map.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import SpriteKit


class Map2D {
    //2
    let view:SKSpriteNode
    let enemy: Enemy
        
    init(enemy: Enemy) {
        view = SKSpriteNode()
        self.enemy = enemy
    }
    
    func placeTile2D(_ tile:Tile, direction:Direction, position:CGPoint) {
        
        let tileSprite = SKSpriteNode(imageNamed: textureImage(tile, direction: direction, action: Action.idle))
        
        if (tile == enemy.tile) {
            enemy.tileSprite2D = tileSprite
            enemy.tileSprite2D.zPosition = 1
        }
        
        tileSprite.position = position
        
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        view.addChild(tileSprite)
        
    }
    
    func placeAllTiles2D() {
        
        for i in 0..<tiles.count {
            
            let row = tiles[i];
            
            for j in 0..<row.count {
                
                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!
                
                let point = CGPoint(x: (j*TILE_SIZE.width), y: -(i*TILE_SIZE.height))
                
                if (tile == Tile.droid) {
                    placeTile2D(Tile.ground, direction:direction, position:point)
                }
                
                placeTile2D(tile, direction:direction, position:point)
            }
            
        }
    }
    
}
