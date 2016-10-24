//
//  Tower.swift
//  IsoGame
//
//  Created by Alexey on 24.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit

class Defender: GameObject {
    
    // Инициализируем с какой-то картинкой
    init() {
        super.init(tile: Tile.droid)
    }
}
