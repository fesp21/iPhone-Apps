//
//  GameViewController.swift
//  Game_2
//
//  Created by Sandeep on 9/19/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import UIKit
import SpriteKit



class GameViewController: UIViewController {
    
    var scene:GameScene!

    override func viewDidLoad() {
        super.viewDidLoad()

                   // Configure the view.
            let skView = self.view as SKView
            skView.showsFPS = false
            skView.showsNodeCount = true
            skView.multipleTouchEnabled = false
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
        
            scene = GameScene(size: skView.bounds.size)
       //     self.scene.size = skView.bounds.size
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
        
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.toRaw())
        } else {
            return Int(UIInterfaceOrientationMask.All.toRaw())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
