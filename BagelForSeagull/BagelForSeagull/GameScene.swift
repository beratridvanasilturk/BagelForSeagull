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
    var bird1 = SKSpriteNode()
    var bird2 = SKSpriteNode()
    var bird3 = SKSpriteNode()
    
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    // MARK: -Funcs
    override func didMove(to view: SKView) {
        
        // Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame )
        
        // Bagel
        bagel = childNode(withName: "bagel") as! SKSpriteNode

        let bagelTexture = SKTexture(imageNamed: "bagel")
        
        bagel.physicsBody = SKPhysicsBody(circleOfRadius: bagelTexture.size().height / 11 )
        bagel.physicsBody?.affectedByGravity = false
        bagel.physicsBody?.isDynamic = true
        bagel.physicsBody?.mass = 0.3
        
        // Other Birds
    
        let bird1Texture = SKTexture(imageNamed: "false bird 1")
            
        bird1 = childNode(withName: "false bird 1") as! SKSpriteNode
        bird1.physicsBody = SKPhysicsBody(circleOfRadius: bird1Texture.size().height / 11)
        bird1.physicsBody?.affectedByGravity = false
        bird1.physicsBody?.isDynamic = true
        bird1.physicsBody?.mass = 0.5
        bird1.physicsBody?.allowsRotation = true
        
        
        
        let bird2Texture = SKTexture(imageNamed: "false bird 2")
            
        bird2 = childNode(withName: "false bird 2") as! SKSpriteNode
        bird2.physicsBody = SKPhysicsBody(circleOfRadius: bird1Texture.size().height / 11)
        bird2.physicsBody?.affectedByGravity = false
        bird2.physicsBody?.isDynamic = true
        bird2.physicsBody?.mass = 0.5
        bird2.physicsBody?.allowsRotation = true
        
        
        
        let bird3Texture = SKTexture(imageNamed: "false bird 3")
            
        bird3 = childNode(withName: "false bird 3") as! SKSpriteNode
        bird3.physicsBody = SKPhysicsBody(circleOfRadius: bird1Texture.size().height / 11)
        bird3.physicsBody?.affectedByGravity = false
        bird3.physicsBody?.isDynamic = true
        bird3.physicsBody?.mass = 0.5
        bird3.physicsBody?.allowsRotation = true
        
        
        }
      
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
        
    
    }

