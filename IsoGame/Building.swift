//
//  Unit.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

class Building: Unit{
    let occupied: [Int] //First number is occupied rows and second is occupied columns
    let cost: Int

    init(sprite: SKSpriteNode, position: CGPoint, occupied: [Int], cost: Int) {
        self.occupied = occupied
        self.cost = cost
        super.init(sprite: sprite, position: position)
    }
    
    
    //Changes picture and adds progress bar
    func build(){
        
    }
    
    func sell(){
        //return cost to player
        //remove();
    }
    
    func remove(){

    }
    
    //Removes and builds new tower on the same position
    func upgrade(){
        remove()
        build()
    }
    
    //Opens the interaction mode in the tower
    func interact(){
        
    }
}
