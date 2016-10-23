//
//  CharacterISO.swift
//  IsoGame
//
//  Created by Alexey on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit
import SpriteKit

class CharacterISO: TileObject {
    let tile: Tile
    
    var facing:Direction
    var action:Action
    
    var tileSpriteIso:SKSpriteNode!
    
    init(tile: Tile) {
        facing = Direction.e
        action = Action.idle
        self.tile = tile
    }
    
}
