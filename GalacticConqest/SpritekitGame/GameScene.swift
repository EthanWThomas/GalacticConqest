//
//  GameScene.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 4/13/23.
//


import GameplayKit
import SpriteKit
import SwiftUI

class GameScene: SKScene, ObservableObject, SKPhysicsContactDelegate {
    var sceneCamera = SKCameraNode()
    var themap: SKTileMapNode = SKTileMapNode(tileSet: SKTileSet(tileGroups: [.empty()]), columns: 24, rows: 24, tileSize: CGSize(width: 32, height: 32))
    var velocidadX: CGFloat = 0.0
    var velocidadY: CGFloat = 0.0
    
    var lastTime: TimeInterval = TimeInterval()
    var deltaTime: TimeInterval = TimeInterval()
    
    var dLastShootTime: CFTimeInterval = 1
    
    var joystick: Joystick = Joystick(radius: 50)
    
    override func didMove(to view: SKView) {
    
//        guard let playerNode = self.childNode(withName: "player") as?  SKSpriteNode
//        else { return }
//        playerNode.position = CGPoint(x: 0, y: 0)
//
//        self.player = playerNode
//
//        if let camera = self.childNode(withName: "Camera") as? SKCameraNode {
//            self.sceneCamera = camera
//        }
//
//        if let mapNode = self.childNode(withName: "Map") as? SKTileMapNode {
//            self.themap = mapNode
//        }
    }
    
    //MARK: GameLogic
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: sceneCamera)

        if location.x < 375 / 10 {
            joystick.setNewPosition(withLocation: location)
            joystick.activo = true
            joystick.show()
        } else {
            joystick.activo = false
            joystick.hiden()
        }
        
//        for touch in touches {
//            let location = touch.location(in: self)
//            let touchNode = atPoint(location)
//            if touchNode.name == "shootButton" {
//
//            }
//        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
 
        for touch in touches {
            let locction = touch.location(in: sceneCamera)

            if joystick.activo {
                let dist = joystick.getDist(withLocation: locction)

//                player.zRotation = joystick.getZRotation()
               
                velocidadX = dist.xDist / 16
                velocidadY = dist.yDist / 16
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if joystick.activo {
            joystick.coreReturn()
            velocidadX = 0
            velocidadY = 0
            joystick.show()
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
//        camera?.position.x = player.position.x
//        camera?.position.y = player.position.y
//        fireButton.position = CGPoint(x: sceneCamera.position.x + 275, y: sceneCamera.position.y - 100)
//        joystick.position = CGPoint(x: (camera?.position.x)! - 275, y: (camera?.position.y)! - 100)
//        joystick.position = CGPoint(x: sceneCamera.position.x - 575, y: sceneCamera.position.y - 250)
        deltaTime = currentTime - lastTime

//        if joystick.activo {
//            player.position = CGPoint(x: player.position.x - (velocidadX),
//                                    y: player.position.y + (velocidadY))
//        }
//        lastTime = currentTime
    }
    
}
