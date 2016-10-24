//
//  AttackType.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

enum AttackType: Int {
    case standard, sup
    
    var description:String {
        switch self {
        case .standard:return "Standard"
        case .sup: return "Super"
        }
    }
    
    var factor:CGFloat {
        switch self {
        case .standard:
            return 1
        case .sup:
            return 0.75
        }
    }
}
