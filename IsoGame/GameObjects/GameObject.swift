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
        self.tileSpriteISO = SKSpriteNode(imageNamed: "iso_3d_"+textureImage(tile, direction: facing, action: Action.idle))
        self.tileSprite2D = SKSpriteNode(imageNamed: textureImage(tile, direction: facing, action: Action.idle))
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
}
