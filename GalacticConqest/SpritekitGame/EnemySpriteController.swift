//
//  EnemySpriteController.swift
//  GalacticConqest
//
//  Created by Ethan Thomas on 6/5/23.
//

import SpriteKit

class EnemyAISpriteController: SKSpriteNode {
    
    var enemySprite: [SKSpriteNode] = []
    
    func spawnEnemy(targetSprite: SKNode) -> SKSpriteNode {
        
        let newEnemy = SKSpriteNode(color: .blue, size: CGSize(width: 50, height: 50))
        
        enemySprite.append(newEnemy)
        
//        let sizeRect = self.size
//        let randomX = CGFloat(arc4random_uniform(UInt32(sizeRect.width)))
//        let ramdomY = CGFloat(arc4random_uniform(UInt32(sizeRect.height)))
//        newEnemy.position = CGPoint(x: CGFloat(randomX), y: CGFloat(ramdomY))
        
        let ai = enemySprite.count - 1
        let rangeForOrientation = SKRange(constantValue: CGFloat(M_2_PI * 7))
        let orrientConstraint = SKConstraint.orient(to: targetSprite, offset: rangeForOrientation)
        
        let rangeToSprite = SKRange(lowerLimit: 50, upperLimit: 90)
        var distanceConstraint: SKConstraint
        
        if enemySprite.count-1 == 0 {
            distanceConstraint = SKConstraint.distance(rangeToSprite, to: targetSprite)
        } else {
            distanceConstraint = SKConstraint.distance(rangeToSprite, to: enemySprite[ai-1])
        }
        
        
        newEnemy.constraints = [orrientConstraint, distanceConstraint]
        
        return newEnemy
    }
}
