//
//  Action.swift
//  IsoGame
//
//  Created by Nikolay Yushkevich on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

enum Action: Int {
    case idle, move
    
    var description:String {
        switch self {
        case .idle:return "Idle"
        case .move:return "Move"
        }
    }
}
