//
//  PlayerModel.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/13/23.
//

import SpriteKit

protocol PlayerModel {
    var sprite: SKNode {get}
    var id: UUID {get}
    var texture: SKTexture {get}
    var health: Double {get}
}


