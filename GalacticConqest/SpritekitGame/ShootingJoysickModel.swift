//
//  AttackModel.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 5/15/23.
//

import Foundation
import SpriteKit

class ShootingJoystickModel: SKShapeNode {
    
    public var activo: Bool = false
    
    private(set) var radius: CGFloat = 0
    private(set) var child = SKShapeNode(fileNamed: "ShootImageBase")
    
    private(set) var vector: CGVector = CGVector()
    private(set) var angle: CGFloat = 0
    private(set) var raio: CGFloat = 0
    var projectileSprite: SKSpriteNode = SKSpriteNode()
    var direction: CGPoint = CGPoint.zero
    
//    @Published var gameScene = GameScene()
    
    var projectitle: SKSpriteNode = SKSpriteNode()
    
    private var radius90: CGFloat = 1.57079633
    
    override init() {
        super.init()
    }
    
    
    convenience init(radius: CGFloat) {
        self.init()
        self.radius = radius
        createAttactJoystickBase()
        createAttackJoystickBaseMain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createAttactJoystickBase() {
        self.path = CGPath(ellipseIn: CGRect(origin: CGPoint(x: -radius, y: -radius),
                                             size:   CGSize(width: radius * 2, height: radius * 2)),
                                             transform: nil)
        
        self.strokeColor = .yellow
        self.alpha = 0.2
        self.lineWidth = 0.5
        self.zPosition = 1.0
    }
    
    private func createAttackJoystickBaseMain() {
        child = SKShapeNode(circleOfRadius: radius / 2)
        child?.fillColor = .white
        child?.fillTexture = SKTexture(imageNamed: "ShootImageBase")
        child!.alpha = 0.3
        child!.zPosition = 2.0
    }
    
    public func setNewPosition(withLocation location: CGPoint) {
        self.position = location
        self.child!.position = location
    }
    
    public func ShootingJoystickPosition(withLocation location: CGPoint) -> (xDist: CGFloat, yDist: CGFloat) {
//
        vector = CGVector(dx: location.x - self.position.x,
                          dy: location.y - self.position.y)
        angle = atan2(vector.dy, vector.dx)
        raio = self.frame.size.height / 2.0

        let xDist: CGFloat = sin(angle - radius90) * raio
        let yDist: CGFloat = cos(angle - radius90) * raio
//
        if (self.frame.contains(location)) {
            self.child?.position = location
        } else {
            self.child?.position = CGPoint(x: self.position.x - xDist,
                                          y: self.position.y + yDist)
        }
//
        return (xDist: xDist, yDist: yDist)
    }
    
    
    public func coreRetun() {
        let retorno: SKAction = SKAction.move(to: self.position, duration: 0.05)
        retorno.timingMode = .easeOut
        child!.run(retorno)
        activo = false
    }
    
    public func getMyZRotation() -> CGFloat {
        return angle - radius90
    }
    
    public func hiden() {
        self.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
        self.child!.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
    }
    
    public func show() {
        self.run(SKAction.fadeAlpha(to: 0.2, duration: 0.5))
        self.child!.run(SKAction.fadeAlpha(to: 0.3, duration: 0.5))
    }
    
}
