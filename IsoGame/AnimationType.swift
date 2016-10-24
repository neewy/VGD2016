//
//  AnimationType.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation

enum AnimationType: Int{
    case stay, attack, move, death
    
    var description:String {
        switch self {
        case .stay:return "Stay"
        case .attack: return "Attack"
        case .move: return "Move"
        case .death: return "Death"
        }
    }
}
