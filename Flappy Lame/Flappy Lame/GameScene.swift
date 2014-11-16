//
//  GameScene.swift
//  Flappy Lame
//
//  Created by Sandeep on 9/18/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene
{
    var bird = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        var BirdTexutre = SKTexture(imageNamed: "bird_2")
        BirdTexutre.filteringMode = SKTextureFilteringMode.Nearest
        
        bird = SKSpriteNode(texture: BirdTexutre)
        bird.setScale(0.5)
        bird.position = CGPoint(x: self.frame.size.width * 0.3 , y: self.frame.size.height * 0.6 )
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height/2.0 )
        bird.physicsBody!.dynamic = true
        bird.physicsBody!.allowsRotation = false
    
        self.addChild(bird)        
        
        
        
}
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
