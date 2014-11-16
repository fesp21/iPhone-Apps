//
//  GameScene.swift
//  Game_2
//
//  Created by Sandeep on 9/19/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "background")
    let foodArea = SKSpriteNode(imageNamed: "foodarea")
    
    override func didMoveToView(view: SKView)
    {
        //BackGround
        self.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        addChild(background)
        
        //FoodArea
        foodArea.position.y = CGFloat(CGRectGetMinY(self.frame) + (foodArea.size.height / 2) )
        addChild(foodArea)
                                                                                                                                                                                                                                                                                                                                          
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
