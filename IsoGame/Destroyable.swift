//
//  Destroyable.swift
//  IsoGame
//
//  Created by Ars Poyezzhayev on 23.10.16.
//  Copyright © 2016 Dmitriy Kapitun. All rights reserved.
//

import Foundation
import SpriteKit

//1
protocol Destroyable {
    func applyDamage(damage: CGFloat, dmgType: AttackType)
}
