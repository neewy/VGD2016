//
//  Buff.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation

enum Buff: Int {
    case acceleration
    
    var description:String {
        switch self {
        case .acceleration: return "Acceleration"
        }
    }

}
