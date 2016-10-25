//
//  Texture.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit
import SpriteKit

protocol TextureObject {
    static var sharedInstance: TextureDroid { get }
    var texturesIso: [[SKTexture]?] { get }
    var textures2D: [[SKTexture]?] { get }
}

func textureImage(_ tile: Tile, direction: Direction, action: Action) -> String {
    switch tile {
    case .droid:
        switch action {
        case .idle:
            switch direction {
            case .n:return "droid_n"
            case .ne:return "droid_ne"
            case .e:return "droid_e"
            case .se:return "droid_se"
            case .s:return "droid_s"
            case .sw:return "droid_sw"
            case .w:return "droid_w"
            case .nw:return "droid_nw"
            }
        case .move:
            switch direction {
            case .n:return "droid_n"
            case .ne:return "droid_ne"
            case .e:return "droid_e"
            case .se:return "droid_se"
            case .s:return "droid_s"
            case .sw:return "droid_sw"
            case .w:return "droid_w"
            case .nw:return "droid_nw"
            }
        }
    case .ground:
        return "ground"
    case .wall:
        switch direction {
        case .n:return "wall_n"
        case .ne:return "wall_ne"
        case .e:return "wall_e"
        case .se:return "wall_se"
        case .s:return "wall_s"
        case .sw:return "wall_sw"
        case .w:return "wall_w"
        case .nw:return "wall_nw"
        }
    case .road:
        return "ground"
    }
}

func textureImage(_ tile: NewTile, direction: Direction, action: Action) -> String {
    switch tile {
    case .grass_1:return "grass-1"
    case .grass_2:return "grass-2"
    case .grass_3:return "grass-3"
    case .leaf: return "leaf"
    case .leaves: return "leaves"
    case .mushroom_1: return "mushroom-1"
    case .mushroom_2: return "mushroom-2"
    case .rock_1: return "rock-1"
    case .rock_2: return "rock-2"
    case .stand: return "stand"
    case .stub: return "stub"
    case .tree_1: return "tree-1"
    case .tree_2: return "tree-2"
    case .tree_3: return "tree-3"
    case .tree_4: return "tree-4"
    case .H_B: return "H-B"
    case .H_L: return "H-L"
    case .H_R: return "H-R"
    case .H_T: return "H-T"
    case .LT_L: return "LT-L"
    case .LT_R: return "LT-R"
    case .RT_R: return "RT-R"
    case .RT_L: return "RT-L"
    case .R: return "R"
    case .P_B: return "P-B"
    case .P_L: return "P-L"
    case .P_R: return "P-R"
    case .P_T: return "P-T"

    }
}


private let textureDroid = TextureDroid()

class TextureDroid: TextureObject {

    class var sharedInstance: TextureDroid {
        return textureDroid
    }

    var texturesIso: [[SKTexture]?]
    var textures2D: [[SKTexture]?]

    init() {

        texturesIso = [[SKTexture]?](repeating: nil, count: 2)
        textures2D = [[SKTexture]?](repeating: nil, count: 2)

        //Idle
        texturesIso[Action.idle.rawValue] = [
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.n, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.ne, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.e, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.se, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.s, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.sw, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.w, action: Action.idle)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.nw, action: Action.idle)),
        ]

        //Move
        texturesIso[Action.move.rawValue] = [
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.n, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.ne, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.e, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.se, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.s, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.sw, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.w, action: Action.move)),
                SKTexture(imageNamed: "iso_3d_" + textureImage(Tile.droid, direction: Direction.nw, action: Action.move)),
        ]

        //Idle
        textures2D[Action.idle.rawValue] = [
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.n, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.ne, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.e, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.se, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.s, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.sw, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.w, action: Action.idle)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.nw, action: Action.idle)),
        ]

        //Move
        textures2D[Action.move.rawValue] = [
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.n, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.ne, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.e, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.se, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.s, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.sw, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.w, action: Action.move)),
                SKTexture(imageNamed: textureImage(Tile.droid, direction: Direction.nw, action: Action.move)),
        ]

    }

}
