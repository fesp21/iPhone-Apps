//
//  GameScene.swift
//  Game
//
//  Created by Sandeep on 9/18/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let playButton = SKSpriteNode(imageNamed: "medal_bronze")
    let test = SKSpriteNode(imageNamed: "Triangle")
    
    override func didMoveToView(view: SKView)
    {
        self.playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(playButton)
        self.backgroundColor = UIColor(red: 120, green: 0, blue: 0, alpha: 1)
        
        
        
        //TEST
        self.test.position = CGPointMake(CGRectGetMaxX(self.frame), 200 )
        self.addChild(test)
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent)
    {
        for touch: AnyObject in touches
        {
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.playButton
            {
                println("To Scene Two ")
                var scene = PlayScene(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = skView.bounds.size
                skView.presentScene(scene)
            }
        }
        
    }
   
    override func update(currentTime: CFTimeInterval)
    {
        /* Called before each frame is rendered */
    }
}
