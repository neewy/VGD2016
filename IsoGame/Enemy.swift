//
//  Droid2D.swift
//  IsoGame
//
//  Created by Alexey on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import UIKit
import SpriteKit

class Enemy: GameObject {
    
    init() {
        super.init(tile: Tile.droid)
    }
    
    func goThroughPath(path: [CGPoint]){
        
        var path2 = findPathFrom(from: point2DToPointTileIndex(point: path[1]), to: point2DToPointTileIndex(point: path[2]))
        print(path2)
        
        if (path2 != nil) {
            
            //2
            var newHeroPos2D = CGPoint()
            var prevHeroPos2D = tileSprite2D.position
            var actions = [SKAction]()
            
            //3
            for i in 1..<path2!.count {
                
                //4
                newHeroPos2D = pointTileIndexToPoint2D(point: path2![i])
                let deltaY = newHeroPos2D.y - prevHeroPos2D.y
                let deltaX = newHeroPos2D.x - prevHeroPos2D.x
                let degrees = atan2(deltaX, deltaY) * (180.0 / CGFloat(M_PI))
                actions.append(SKAction.run({
                    self.facing = degreesToDirection(degrees)
                    self.update()
                }))
                
                //5
                let velocity:Double = Double(TILE_SIZE.width)*2
                var time = 0.0
                
                if i == 1 {
                    
                    //6
                    time = TimeInterval(distance(newHeroPos2D, p2: tileSprite2D.position)/CGFloat(velocity))
                    
                } else {
                    
                    //7
                    let baseDuration =  Double(TILE_SIZE.width)/velocity
                    var multiplier = 1.0
                    
                    let direction = degreesToDirection(degrees)
                    
                    if direction == Direction.ne
                        || direction == Direction.nw
                        || direction == Direction.sw
                        || direction == Direction.se
                    {
                        //8
                        multiplier = 1.4
                    }
                    
                    //9
                    time = multiplier*baseDuration
                }
                
                //10
                actions.append(SKAction.move(to:newHeroPos2D, duration: time))
                
                //11
                prevHeroPos2D = newHeroPos2D
                
            }
            
            //12
            tileSprite2D.removeAllActions()
            tileSprite2D.run(SKAction.sequence(actions))
            }
    }
}
