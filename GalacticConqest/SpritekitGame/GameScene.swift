//
//  GameScene.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/13/23.
//

import Foundation
import GameplayKit
import SpriteKit
import SwiftUI

class GameScene: SKScene, ObservableObject, SKPhysicsContactDelegate {
    
    var player: SKSpriteNode?
    var sceneCamera = SKCameraNode()
    var TheMap: SKTileMapNode = SKTileMapNode()
    
    let moveJoystick = 🕹(withDiameter: 100)
    let rotateJoystick = TLAnalogJoystick(withDiameter: 100)
    
    //MARK: Joystick
    
    override func didMove(to view: SKView) {
        
        camera = sceneCamera
        
        guard let playerNode = self.childNode(withName: "player") as?  SKSpriteNode
        else { return }
        
        self.player = playerNode
       
        
        if let camera = self.childNode(withName: "Camera") as? SKCameraNode {
            self.sceneCamera = camera
            
        }
        
        if let map = self.childNode(withName: "TileNode") as? SKTileMapNode {
            self.TheMap = map
        }
        self.camera = sceneCamera
        
        
//        setupJoystick()
    }
    
    lazy var analogJoystick: TLAnalogJoystickComponent = {
        let js = TLAnalogJoystickComponent(diameter: 100, color: nil, image: UIImage(named: "jStick"))
        return js
        
    }()
    
    func setupJoystick() {
        addChild(analogJoystick)
    }
    
    override func update(_ currentTime: TimeInterval) {
        //
    }
    
}


