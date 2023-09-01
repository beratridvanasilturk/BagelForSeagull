//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Atil Samancioglu on 12.08.2019.
//  Copyright © 2019 Atil Samancioglu. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    //var bird2 = SKSpriteNode()
    
    var bagel = SKSpriteNode()
    var bird1 = SKSpriteNode()
    var bird2 = SKSpriteNode()
    var bird3 = SKSpriteNode()
    var seagull = SKSpriteNode()
    
    var gameStarted = false
    
    var originalPosition : CGPoint?
    
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32 {
        case Bagel = 1
        case Bird = 2
        case Seagull = 4
    }

    override func didMove(to view: SKView) {
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: -self.frame.width / 4, y: -self.frame.height / 4)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
        bird2.zPosition = 1
        self.addChild(bird2)
 */
        
        //Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        // Bird
        
        bagel = childNode(withName: "bagel") as! SKSpriteNode
        
        let bagelTexture = SKTexture(imageNamed: "bagel")
        
        
        bagel.physicsBody = SKPhysicsBody(circleOfRadius: bagelTexture.size().height / 13)
        bagel.physicsBody?.affectedByGravity = false
        bagel.physicsBody?.isDynamic = true
        bagel.physicsBody?.mass = 0.4
        originalPosition = bagel.position
        
        bagel.physicsBody?.contactTestBitMask = ColliderType.Bagel.rawValue
        bagel.physicsBody?.categoryBitMask = ColliderType.Bagel.rawValue
        bagel.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue
        
        
        
        
        //Box
        
        let bird1Texture = SKTexture(imageNamed: "bird1")
        
        bird1 = childNode(withName: "bird1") as! SKSpriteNode
        bird1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bird1Texture.size().width / 6, height: bird1Texture.size().height / 6))
        bird1.physicsBody?.isDynamic = true
        bird1.physicsBody?.affectedByGravity = true
        bird1.physicsBody?.allowsRotation = true
        bird1.physicsBody?.mass = 0.4
    
        
        bird1.physicsBody?.contactTestBitMask = ColliderType.Bagel.rawValue
        bird1.physicsBody?.categoryBitMask = ColliderType.Bagel.rawValue
        
        // Bird1'in bagel'dan etkilenmesini, onunla compact olunca harekete gecmesini saglar
        bird1.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue
        
        
        let bird2Texture = SKTexture(imageNamed: "bird2")
        
        bird2 = childNode(withName: "bird2") as! SKSpriteNode
        bird2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bird2Texture.size().width / 6, height: bird2Texture.size().height / 6))
        bird2.physicsBody?.isDynamic = true
        bird2.physicsBody?.affectedByGravity = true
        bird2.physicsBody?.allowsRotation = true
        bird2.physicsBody?.mass = 0.4
        
        bird2.physicsBody?.contactTestBitMask = ColliderType.Bagel.rawValue
        bird2.physicsBody?.categoryBitMask = ColliderType.Bagel.rawValue
        
        bird2.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue

        
        let bird3Texture = SKTexture(imageNamed: "bird3")
        
        bird3 = childNode(withName: "bird3") as! SKSpriteNode
        bird3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bird3Texture.size().width / 6, height: bird3Texture.size().height / 6))
        bird3.physicsBody?.isDynamic = true
        bird3.physicsBody?.affectedByGravity = true
        bird3.physicsBody?.allowsRotation = true
        bird3.physicsBody?.mass = 0.4
        
        bird3.physicsBody?.contactTestBitMask = ColliderType.Bagel.rawValue
        bird3.physicsBody?.categoryBitMask = ColliderType.Bagel.rawValue
        
        bird3.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue

        
        let seagullTexture = SKTexture(imageNamed: "seagull")
        
        seagull = childNode(withName: "seagull") as! SKSpriteNode
        seagull.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: seagullTexture.size().width / 6, height: seagullTexture.size().height / 6))
        seagull.physicsBody?.isDynamic = true
        seagull.physicsBody?.affectedByGravity = true
        seagull.physicsBody?.allowsRotation = true
        seagull.physicsBody?.mass = 0.4
        
        seagull.physicsBody?.contactTestBitMask = ColliderType.Seagull.rawValue
        seagull.physicsBody?.categoryBitMask = ColliderType.Seagull.rawValue
        
        seagull.physicsBody?.collisionBitMask = ColliderType.Bagel.rawValue

        
//        box5 = childNode(withName: "box5") as! SKSpriteNode
//        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
//        box5.physicsBody?.isDynamic = true
//        box5.physicsBody?.affectedByGravity = true
//        box5.physicsBody?.allowsRotation = true
//        box5.physicsBody?.mass = 0.4
//        box5.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue

     
        //Label
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 40
        scoreLabel.fontColor = .black
        scoreLabel.text = "Score: 0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)
        
        
       
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.collisionBitMask == ColliderType.Bagel.rawValue {
                
                score += 3
                scoreLabel.text = String(score)
                print("YES ")
            } else {
            score -= 1
            scoreLabel.text = String(score)
            print("NO ")
        }
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
        bird.physicsBody?.affectedByGravity = true
 */
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
        // Called before each frame is rendered
        
        
        if let birdPhysicsBody = bagel.physicsBody {
            
            if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 && birdPhysicsBody.angularVelocity <= 0.1 && gameStarted == true {
                
                
                bagel.physicsBody?.affectedByGravity = false
                bagel.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bagel.physicsBody?.angularVelocity = 0
                bagel.zPosition = 1
                bagel.position = originalPosition!
                
                
                //score = 0
                //scoreLabel.text = String(score)
                
                gameStarted = false
                
                
            }
            
        }
        
    }
}
