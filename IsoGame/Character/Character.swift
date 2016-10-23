//
//  Character.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit
import SpriteKit


class Character: TileObject {
    let tile: Tile
    
    var facing:Direction
    var action:Action
    
    var tileSprite2D:SKSpriteNode!
    var tileSpriteIso:SKSpriteNode!
    
    init(tile: Tile) {
        facing = Direction.e
        action = Action.idle
        self.tile = tile
    }
    
}
