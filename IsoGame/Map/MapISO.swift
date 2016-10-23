//
//  Map.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import SpriteKit

class MapISO {
    //2
    let view:SKSpriteNode
    let layerIsoGround:SKNode
    let layerIsoObjects:SKNode
    let enemy: Enemy
    
    let tileSize = TILE_SIZE
    
    init(enemy: Enemy) {
        view = SKSpriteNode()
        layerIsoGround = SKNode()
        layerIsoObjects = SKNode()
        self.enemy = enemy
    }
    
    func placeTileIso(_ tile:Tile, direction:Direction, position:CGPoint) {
        
        let tileSprite = SKSpriteNode(imageNamed: "iso_3d_"+textureImage(tile, direction: direction, action: Action.idle))
        
        if (tile == enemy.tile) {
            enemy.tileSpriteISO = tileSprite
        }
        
        tileSprite.position = position
        
        tileSprite.anchorPoint = CGPoint(x:0, y:0)
        
        if (tile == Tile.ground) {
            layerIsoGround.addChild(tileSprite)
        } else if (tile == Tile.wall || tile == Tile.droid) {
            layerIsoObjects.addChild(tileSprite)
        }
        
    }
    func placeAllTilesISO() {
        
        for i in 0..<tiles.count {
            
            let row = tiles[i];
            
            for j in 0..<row.count {
                
                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!
                
                let point = point2DToIso(CGPoint(x: (j*tileSize.width), y: -(i*tileSize.height)))
                
                if (tile == Tile.droid) {
                    placeTileIso(Tile.ground, direction:direction, position:point)
                }
                
                placeTileIso(tile, direction:direction, position:point)
                
            }
        }
    }
    
    func sortDepth() {
        
        //1
        let childrenSortedForDepth = layerIsoObjects.children.sorted() {
            
            let p0 = pointIsoTo2D($0.position)
            let p1 = pointIsoTo2D($1.position)
            
            if ((p0.x+(-p0.y)) > (p1.x+(-p1.y))) {
                return false
            } else {
                return true
            }
            
        }
        //2
        for i in 0..<childrenSortedForDepth.count {
            
            let node = childrenSortedForDepth[i]
            
            node.zPosition = CGFloat(i)
            
        }
    }

}
