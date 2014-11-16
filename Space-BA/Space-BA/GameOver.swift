//
//  GameOver.swift
//  Space-BA
//
//  Created by Sandeep on 9/22/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import UIKit
import SpriteKit


class GameOver: SKScene
{
    init(size: CGSize , won:Bool)
    {
        super.init(size: size)
        self.backgroundColor = SKColor.blackColor()
        
        var message:NSString = NSString()
        
        if(won)
        {
            message = "Yoy win"
        }
        else
        {
            message = "GameOver"
        }
        
        var label = SKLabelNode(fontNamed: "DamascusBOLD")
        label.text = message
        label.fontColor = SKColor.whiteColor()
        label.position = CGPointMake(self.size.width/2 , self.size.height/2)
        
        self.addChild(label)
        
        self.runAction(SKAction.sequence([SKAction.waitForDuration(3.0),
            SKAction.runBlock({ () -> Void in
                var transition:SKTransition = SKTransition.flipHorizontalWithDuration(0.5)
                var scene:SKScene = GameScene(size: self.size)
                
                self.view?.presentScene(scene, transition: transition)
                
                
        })]))
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
