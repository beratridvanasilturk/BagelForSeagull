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
    var seagull = SKSpriteNode()
    var bird1 = SKSpriteNode()
    var bird2 = SKSpriteNode()
    var bird3 = SKSpriteNode()
    
    var gameStarted = false
    // TouchesEnded'da cektikten sonra firlatmak icin kullandik
    var originalPosition: CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Bagel = 1
        case Seagull = 2
        case Bird = 4
        
    }
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    // MARK: -Funcs
    override func didMove(to view: SKView) {
        
        // Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFill
        // Contactlari algilamak icin kullanilir
        self.physicsWorld.contactDelegate = self
        
        // Bagel
        bagel = childNode(withName: "bagel") as! SKSpriteNode
        let bagelTexture = SKTexture(imageNamed: "bagel")
        
        bagel.physicsBody = SKPhysicsBody(circleOfRadius: bagelTexture.size().height / 11 )
        bagel.physicsBody?.affectedByGravity = false
        bagel.physicsBody?.isDynamic = true
        bagel.physicsBody?.mass = 0.3
        originalPosition = bagel.position
        
        // Cisimlerin birbiri ile etkilesimini duzenler
        bagel.physicsBody?.contactTestBitMask = ColliderType.Bagel.rawValue
        bagel.physicsBody?.categoryBitMask = ColliderType.Bagel.rawValue
        // Sadece kus ile carpisinca if blogunu atlamamiza ve scoru ona gore duzenlemede kullandik
        bagel.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        // Seagull
        
        // Other Birds
        
        let bird1Texture = SKTexture(imageNamed: "false bird 1")
        
        bird1.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue
        
        bird1 = childNode(withName: "false bird 1") as! SKSpriteNode
        bird1.physicsBody = SKPhysicsBody(circleOfRadius: bird1Texture.size().height / 11)
        bird1.physicsBody?.affectedByGravity = false
        bird1.physicsBody?.isDynamic = true
        bird1.physicsBody?.mass = 0.5
        bird1.physicsBody?.allowsRotation = true
        
        
        
        let bird2Texture = SKTexture(imageNamed: "false bird 2")
        
        bird2.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue
        
        bird2 = childNode(withName: "false bird 2") as! SKSpriteNode
        bird2.physicsBody = SKPhysicsBody(circleOfRadius: bird2Texture.size().height / 11)
        bird2.physicsBody?.affectedByGravity = false
        bird2.physicsBody?.isDynamic = true
        bird2.physicsBody?.mass = 0.5
        bird2.physicsBody?.allowsRotation = true
        
        
        
        let bird3Texture = SKTexture(imageNamed: "false bird 3")
        
        bird3.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue
        
        bird3 = childNode(withName: "false bird 3") as! SKSpriteNode
        bird3.physicsBody = SKPhysicsBody(circleOfRadius: bird3Texture.size().height / 11)
        bird3.physicsBody?.affectedByGravity = false
        bird3.physicsBody?.isDynamic = true
        bird3.physicsBody?.mass = 0.5
        bird3.physicsBody?.allowsRotation = true
        
        // Label
        
        scoreLabel.fontName = "Helvatica"
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = .darkGray
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
        
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        // Iki farkli cismin birbiri ile etkilesimini duzenler
        if contact.bodyA.collisionBitMask == ColliderType.Bagel.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bagel.rawValue {
            
            score += 1
            scoreLabel.text = String(score)
            
            print("Contact")
        }
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
                
                score = 0
                scoreLabel.text = String(score)
                
                gameStarted = false
                
            }
        }
    }
}
