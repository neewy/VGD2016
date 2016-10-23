//
//  Map.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import SpriteKit


class Map {
    //2
    let view2D:SKSpriteNode
    let viewIso:SKSpriteNode
    let layerIsoGround:SKNode
    let layerIsoObjects:SKNode
    let hero: Character

    let tileSize = (width:32, height:32)
    
    init(hero: Character) {
        view2D = SKSpriteNode()
        viewIso = SKSpriteNode()
        layerIsoGround = SKNode()
        layerIsoObjects = SKNode()
        self.hero = hero
    }

    func placeTile2D(_ tile:Tile, direction:Direction, position:CGPoint) {

        let tileSprite = SKSpriteNode(imageNamed: textureImage(tile, direction: direction, action: Action.idle))

        if (tile == hero.tile) {
            hero.tileSprite2D = tileSprite
            hero.tileSprite2D.zPosition = 1
        }

        tileSprite.position = position

        tileSprite.anchorPoint = CGPoint(x:0, y:0)

        view2D.addChild(tileSprite)

    }

    func placeAllTiles2D() {

        for i in 0..<tiles.count {

            let row = tiles[i];

            for j in 0..<row.count {

                let tile = Tile(rawValue: row[j].0)!
                let direction = Direction(rawValue: row[j].1)!

                let point = CGPoint(x: (j*tileSize.width), y: -(i*tileSize.height))

                if (tile == Tile.droid) {
                    placeTile2D(Tile.ground, direction:direction, position:point)
                }

                placeTile2D(tile, direction:direction, position:point)
            }

        }
    }

    func placeTileIso(_ tile:Tile, direction:Direction, position:CGPoint) {

        let tileSprite = SKSpriteNode(imageNamed: "iso_3d_"+textureImage(tile, direction: direction, action: Action.idle))

        if (tile == hero.tile) {
            hero.tileSpriteIso = tileSprite
        }

        tileSprite.position = position

        tileSprite.anchorPoint = CGPoint(x:0, y:0)

        if (tile == Tile.ground) {
            layerIsoGround.addChild(tileSprite)
        } else if (tile == Tile.wall || tile == Tile.droid) {
            layerIsoObjects.addChild(tileSprite)
        }

    }
    func placeAllTilesIso() {

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


    func point2DToIso(_ p:CGPoint) -> CGPoint {

        //invert y pre conversion
        var point = p * CGPoint(x:1, y:-1)

        //convert using algorithm
        point = CGPoint(x:(point.x - point.y), y: ((point.x + point.y) / 2))

        //invert y post conversion
        point = point * CGPoint(x:1, y:-1)

        return point

    }

    func pointIsoTo2D(_ p:CGPoint) -> CGPoint {

        //invert y pre conversion
        var point = p * CGPoint(x:1, y:-1)

        //convert using algorithm
        point = CGPoint(x:((2 * point.y + point.x) / 2), y: ((2 * point.y - point.x) / 2))

        //invert y post conversion
        point = point * CGPoint(x:1, y:-1)

        return point

    }

    func sortDepth() {

        //1
        let childrenSortedForDepth = layerIsoObjects.children.sorted() {

            let p0 = self.pointIsoTo2D($0.position)
            let p1 = self.pointIsoTo2D($1.position)

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
