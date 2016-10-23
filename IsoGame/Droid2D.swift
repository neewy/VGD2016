//
//  Droid2D.swift
//  IsoGame
//
//  Created by Alexey on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit

class Droid2D: Character2D {
    init() {
        super.init(tile: Tile.droid)
    }
    
    func update() {
        
        if (self.tileSprite2D != nil) {
            
            self.tileSprite2D.texture = TextureDroid.sharedInstance.textures2D[self.action.rawValue]![self.facing.rawValue]
        }
    }
    
}
