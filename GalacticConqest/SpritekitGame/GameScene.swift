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
    
    var player: SKSpriteNode = SKSpriteNode()
    var player2: SKSpriteNode = SKSpriteNode()
    var sceneCamera = SKCameraNode()
    var projectileSprite: SKSpriteNode = SKSpriteNode()
    
    var themap: SKTileMapNode = SKTileMapNode(tileSet: SKTileSet(tileGroups: [.empty()]), columns: 24, rows: 24, tileSize: CGSize(width: 32, height: 32))
    
    var enemySprite = EnemyAISpriteController()
    
//    var playerSpeed = 3.0
    var plasmaCategory: UInt32 = 0x1 << 0
    var velocidadX: CGFloat = 0.0
    var velocidadY: CGFloat = 0.0
    
    var lastTime: TimeInterval = TimeInterval()
    var deltaTime: TimeInterval = TimeInterval()
    
    var joystick: Joystick = Joystick(radius: 50)
    var attackJoystick: ShootingJoystickModel = ShootingJoystickModel(radius: 50)
    
    
    override func didMove(to view: SKView) {
        
        guard let playerNode = self.childNode(withName: "player") as?  SKSpriteNode
        else { return }
        playerNode.position = CGPoint(x: 0, y: 0)
        
        self.player = playerNode
        
        guard let playerNode2 = self.childNode(withName: "player2") as? SKSpriteNode
        else { return }
        playerNode2.position = CGPoint(x: 50, y: 50)
        
        self.player2 = playerNode2

        if let camera = self.childNode(withName: "Camera") as? SKCameraNode {
            self.sceneCamera = camera
        }
        
        if let mapNode = self.childNode(withName: "Map") as? SKTileMapNode {
            self.themap = mapNode
        }

        camera = sceneCamera
        
        joystick.setNewPosition(withLocation: CGPoint(x: 0, y: -size.height/3))
       
        camera?.addChild(joystick)
        camera?.addChild(joystick.child)
        
        self.addChild(enemySprite.spawnEnemy(targetSprite: player))

        joystick.hiden()
//        attackJoystick.hiden()
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size)
        player.position = CGPoint(x: self.frame.maxX, y: self.frame.midY)
        
        player.xScale = 0.5
        player.yScale = 0.5
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
    }
    
    
    //MARK: Joystick
    func attackjoystickBeganCalculations(_ touches: Set<UITouch>) {
        let touch = touches.first!
        let location = touch.location(in: sceneCamera)
        
        if location.x > 375 / 10 {
            attackJoystick.setNewPosition(withLocation: location)
            attackJoystick.activo = true
            attackJoystick.show()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        attackjoystickBeganCalculations(touches)
        
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
    }
    
    func attackjoysticktouchesMovedCalculations(_ touches: Set<UITouch>) {
        for touch in touches {
            let locction = touch.location(in: sceneCamera)
            
            if attackJoystick.activo {
                let dist = attackJoystick.aimInJoystickPosition(withLocation: locction)
                
                player.zRotation = attackJoystick.getMyZRotation()
                
                velocidadX = dist.xDist / 16
                velocidadY = dist.yDist / 16
                
                
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        attackjoysticktouchesMovedCalculations(touches)
        
        for touch in touches {
            let locction = touch.location(in: sceneCamera)

            if joystick.activo {
                let dist = joystick.getDist(withLocation: locction)

                player.zRotation = joystick.getZRotation()

                velocidadX = dist.xDist / 16
                velocidadY = dist.yDist / 16

            }
        }
    }
    
    func attackJoystickTouchesEnded(_ touches: Set<UITouch>) {
        if attackJoystick.activo {
            attackJoystick.coreRetun()
            velocidadX = 0
            velocidadY = 0
            attackJoystick.show()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        attackJoystickTouchesEnded(touches)

        if joystick.activo {
            joystick.coreReturn()
            velocidadX = 0
            velocidadY = 0
            joystick.show()
        }
    }

    override func update(_ currentTime: TimeInterval) {
        camera?.position.x = player.position.x
        camera?.position.y = player.position.y
//        fireButton.position = CGPoint(x: sceneCamera.position.x + 275, y: sceneCamera.position.y - 100)
//        joystick.position = CGPoint(x: (camera?.position.x)! - 275, y: (camera?.position.y)! - 100)
//        joystick.position = CGPoint(x: sceneCamera.position.x - 575, y: sceneCamera.position.y - 250)
        deltaTime = currentTime - lastTime

        if joystick.activo {
            player.position = CGPoint(x: player.position.x - (velocidadX),
                                    y: player.position.y + (velocidadY))
        }
        
        
        lastTime = currentTime
    }
    
}
