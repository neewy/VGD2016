//
//  TextureObject.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import SpriteKit

protocol TextureObject {
    static var sharedInstance: TextureDroid {get}
    var texturesIso:[[SKTexture]?] {get}
    var textures2D:[[SKTexture]?] {get}
}
