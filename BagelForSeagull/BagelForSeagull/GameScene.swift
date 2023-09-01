//
//  GameScene.swift
//  BagelForSeagull
//
//  Created by Berat Rıdvan Asiltürk on 1.09.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: -Variables
    var bagel = SKSpriteNode()
    var bird1 = SKSpriteNode()
    var bird2 = SKSpriteNode()
    var bird3 = SKSpriteNode()
    
    var gameStarted = false
    // TouchesEnded'da cektikten sonra firlatmak icin kullandik
    var originalPosition: CGPoint?
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    // MARK: -Funcs
    override func didMove(to view: SKView) {
        
        // Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFill
        
        // Bagel
        bagel = childNode(withName: "bagel") as! SKSpriteNode
        let bagelTexture = SKTexture(imageNamed: "bagel")
        
        bagel.physicsBody = SKPhysicsBody(circleOfRadius: bagelTexture.size().height / 11 )
        bagel.physicsBody?.affectedByGravity = false
        bagel.physicsBody?.isDynamic = true
        bagel.physicsBody?.mass = 0.3
        originalPosition = bagel.position
        
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
        bird2.physicsBody = SKPhysicsBody(circleOfRadius: bird2Texture.size().height / 11)
        bird2.physicsBody?.affectedByGravity = false
        bird2.physicsBody?.isDynamic = true
        bird2.physicsBody?.mass = 0.5
        bird2.physicsBody?.allowsRotation = true
        
        
        
        let bird3Texture = SKTexture(imageNamed: "false bird 3")
        
        bird3 = childNode(withName: "false bird 3") as! SKSpriteNode
        bird3.physicsBody = SKPhysicsBody(circleOfRadius: bird3Texture.size().height / 11)
        bird3.physicsBody?.affectedByGravity = false
        bird3.physicsBody?.isDynamic = true
        bird3.physicsBody?.mass = 0.5
        bird3.physicsBody?.allowsRotation = true
        
        
        
        
    }
        
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bagel {
                                bagel.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bagel {
                                bagel.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    
                    for node in touchNodes {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bagel {
                                
                                let dx = -(touchLocation.x - originalPosition!.x)
                                let dy = -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bagel.physicsBody?.applyImpulse(impulse)
                                bagel.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                            }
                        }
                    }
                }
            }
        }
    }
    

    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if let bagelPhysicsBody = bagel.physicsBody {
            
            // hiz durumunu belirler velocity:hiz
            if bagelPhysicsBody.velocity.dx <= 0.1 && bagelPhysicsBody.velocity.dy <= 0.1 && bagelPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                // Oyun basindaki duruma donrururuz
                bagel.physicsBody?.affectedByGravity = false
                bagel.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bagel.physicsBody?.angularVelocity = 0
                bagel.zPosition = 1
                bagel.position = originalPosition!
                gameStarted = false
            }
        }
    }
}
