//
//  GameScene.swift
//  BagelForSeagull
//
//  Created by Berat Rıdvan Asiltürk on 1.09.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    // MARK: -Variables
    var bagel = SKSpriteNode()
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    // MARK: -Funcs
    override func didMove(to view: SKView) {
        
        bagel = childNode(withName: "bagel") as! SKSpriteNode
        

        let bagelTexture = SKTexture(imageNamed: "bagel")
        
        bagel.physicsBody = SKPhysicsBody(circleOfRadius: bagelTexture.size().height / 12 )
        bagel.physicsBody?.affectedByGravity = true
        bagel.physicsBody?.isDynamic = true
        bagel.physicsBody?.mass = 0.3
       
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
