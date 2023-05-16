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
    var TheMap: SKTileMapNode = SKTileMapNode()
    var fireButton: SKSpriteNode = SKSpriteNode()
    
    var playerSpeed = 3.0
    var plasmaCategory: UInt32 = 0x1 << 0
    var velocidadX: CGFloat = 0.0
    var velocidadY: CGFloat = 0.0
    
    var lastTime: TimeInterval = TimeInterval()
    var deltaTime: TimeInterval = TimeInterval()
    
    var joystick: Joystick = Joystick(radius: 50)
    var attackJoystivk: AttackModel = AttackModel(radius: 50)
    
    let myPoint = CGPoint(x: -275, y: -100)
    
    //MARK: Joystick
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

        camera = sceneCamera
        
        if let map = self.childNode(withName: "TileNode") as? SKTileMapNode {
            self.TheMap = map
        }
        
        joystick.setNewPosition(withLocation: CGPoint(x: 0, y: -size.height/3))
       
        camera?.addChild(joystick)
        camera?.addChild(joystick.child)
        
//        camera?.addChild(attackJoystivk)
//        camera?.addChild(attackJoystivk.child!)
        
        joystick.hiden()
        
        attackJoystivk.hiden()
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.frame.size)
        player.position = CGPoint(x: self.frame.maxX, y: self.frame.midY)
        
        player.xScale = 0.5
        player.yScale = 0.5
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        
//        addFireButton()
    }
    
    func addFireButton() {
        fireButton = SKSpriteNode(imageNamed: "shooterButton")
        fireButton.size = CGSize(width: 95, height: 95)

        self.addChild(fireButton)
        
        fireButton.name = "fireButton"

        fireButton.isHidden = false
    }
    
    func firePlasma() {
        let plasmaFireNode = SKSpriteNode(imageNamed: "dot")
        plasmaFireNode.position = player.position
        plasmaFireNode.position.y += 6
        
        plasmaFireNode.physicsBody = SKPhysicsBody(circleOfRadius: plasmaFireNode.size.width / 2)
        plasmaFireNode.physicsBody?.isDynamic = true
        
        plasmaFireNode.physicsBody?.categoryBitMask = plasmaCategory
//        plasmaFireNode.physicsBody?.contactTestBitMask = alienCategory
        plasmaFireNode.physicsBody?.collisionBitMask = 0
        plasmaFireNode.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(plasmaFireNode)
        
        let animationDuration: TimeInterval = 0.3
        
        var actionArray = [SKAction]()
        
        actionArray.append(SKAction.move(to: CGPoint(x: player.position.x, y: self.frame.size.height + 10), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        
        plasmaFireNode.run(SKAction.sequence(actionArray))
        
    }
    
    func rotateAttackJotstickMovedCalculation(_ touches: Set<UITouch>) {
        for touch in touches {
            let location = touch.location(in: sceneCamera)
            
            if attackJoystivk.activo {
                let dist = attackJoystivk.getDist(withLocation: location)
                
                player.zRotation = attackJoystivk.getMyZRotation()
                
                velocidadX = dist.xDist / 16
                velocidadY = dist.yDist / 16
                
            }
        }
    }
    
    func attackJoystickBeganCalculation(_ touches: Set<UITouch>) {
        for touch in touches {
            let location = touch.location(in: sceneCamera)
            if !attackJoystivk.activo {
                attackJoystivk.position = location
                attackJoystivk.activo = true
                attackJoystivk.show()
            }
        }
    }
    
    func attackJoystickEndedCalculation(_ touches: Set<UITouch>) {
        if attackJoystivk.activo {
            attackJoystivk.coreRetun()
            velocidadX = 0
            velocidadX = 0
            attackJoystivk.hiden()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let joystickHindenArea = CGRect(x: 0, y: 0, width: frame.midX, height: frame.height)
//    attackJoystickBeganCalculation(touches)
        for touch in touches {
            let location = touch.location(in: sceneCamera)
            if !joystick.activo {
                joystick.setNewPosition(withLocation: location)
                joystick.activo = true
                joystick.show()
            }
        }
//        let cameraPoint = self.convert(myPoint, to: sceneCamera)
//        for touch in touches {
//            let location = touch.location(in: self)
//            let touchedNode = atPoint(location)
//            if touchedNode.name == "fireButton" {
//               firePlasma()
//            }
//        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        rotateAttackJotstickMovedCalculation(touches)
        for touch in touches {
            let locction = touch.location(in: sceneCamera)

            if joystick.activo {
                let dist = joystick.getDist(withLocation: locction)

                player.zRotation = joystick.getZRotation()

                velocidadX = dist.xDist / 16
                velocidadY = dist.yDist / 16

            }
        }
        
//        rotateAttackJotstickCalculations(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        attackJoystickEndedCalculation(touches)
        if joystick.activo {
            joystick.coreReturn()
            velocidadX = 0
            velocidadY = 0
            joystick.hiden()
        }
    }

    override func update(_ currentTime: TimeInterval) {
        camera?.position.x = player.position.x
        camera?.position.y = player.position.y
        fireButton.position = CGPoint(x: sceneCamera.position.x + 275, y: sceneCamera.position.y - 100)
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


