//
//  Direction.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

enum Direction: Int {
    
    case n,ne,e,se,s,sw,w,nw
    
    var description:String {
        switch self {
        case .n:return "North"
        case .ne:return "North East"
        case .e:return "East"
        case .se:return "South East"
        case .s:return "South"
        case .sw:return "South West"
        case .w:return "West"
        case .nw:return "North West"
        }
    }
}
