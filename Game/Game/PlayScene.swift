//
//  PlayScene.swift
//  Game
//
//  Created by Sandeep on 9/18/14.
//  Copyright (c) 2014 it'sDivine.Inc. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene ,SKPhysicsContactDelegate
{
    let floor = SKSpriteNode(imageNamed: "floor")
    let ball = SKSpriteNode(imageNamed: "grenade")
    let scoreText = SKLabelNode(fontNamed: "Chalkduster")
    
    var origFloorX = CGFloat(0)
    var maxBarX = CGFloat(0)
    var groundSpeed = 10
    var baseline = CGFloat(0)
    var onGround = true
    var velocityY = CGFloat(0)
    var baseline2 = CGFloat(0)
    let gravity = CGFloat(0.2)
    let block1 = SKSpriteNode(imageNamed: "Block")
    let block2 = SKSpriteNode(imageNamed: "Mario Block")
    
    var score = 0
    var blockMaxX = CGFloat(0)
    var origBlockPosX = CGFloat(0)
    
    var blockStatus:Dictionary<String,BlockStatus> = [:]
    
    enum ColliderType:UInt32{
        case Ball = 1
        case Block = 2
    }
    
    override func didMoveToView(view: SKView)
    {
        // Contact Deleagte 
        self.physicsWorld.contactDelegate = self
        
        
        
        
        
        
        println("New Scene")
        self.backgroundColor = UIColor(red: 0, green: 99, blue: 0, alpha: 0.5)
        self.floor.anchorPoint = CGPointMake(0 , 0.5)
        self.floor.position = CGPointMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame) + self.floor.size.height /  2 )
        self.addChild(self.floor)
        self.origFloorX = self.floor.position.x
        self.maxBarX = self.floor.size.width - self.frame.size.width
        self.maxBarX *= -1
        
        
        //BALL
        self.baseline2 = CGRectGetMinY(self.frame) + self.floor.size.height  + self.ball.size.height/2 - 10
        self.baseline = self.floor.position.y + ( self.floor.size.height / 2 )
        
        self.ball.position = CGPointMake(CGRectGetMinX(self.frame) + ( self.ball.size.width/4 + 20 ), self.baseline2 )
        
        self.addChild(ball)
        
        // BLOCKS
        
        self.block1.position = CGPointMake( ( CGRectGetMaxX( self.frame ) + self.block1.size.width ),baseline2)
        
        
        self.block2.position = CGPointMake( ( CGRectGetMaxX( self.frame ) + self.block2.size.width + 100  ),baseline2 + self.block2.size.height / 2)
        
        self.origBlockPosX = block1.position.x
        
        self.block1.name = "block1"
        self.block2.name = "block2"
        //Collisions
        self.ball.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(self.ball.size.width/2))
        self.ball.physicsBody?.affectedByGravity = false
        self.ball.physicsBody?.categoryBitMask = ColliderType.Ball.toRaw()
        self.ball.physicsBody?.collisionBitMask = ColliderType.Block.toRaw()
        self.ball.physicsBody?.contactTestBitMask = ColliderType.Block.toRaw()
        
        
        self.block1.physicsBody = SKPhysicsBody(rectangleOfSize: self.block1.size)
        self.block1.physicsBody?.affectedByGravity = false
        self.block1.physicsBody?.categoryBitMask = ColliderType.Block.toRaw()
        self.block1.physicsBody?.collisionBitMask = ColliderType.Ball.toRaw()
        self.block1.physicsBody?.contactTestBitMask = ColliderType.Ball.toRaw()
        
        
        self.block2.physicsBody = SKPhysicsBody(rectangleOfSize: self.block2.size)
        self.block2.physicsBody?.affectedByGravity = false
        self.block2.physicsBody?.categoryBitMask = ColliderType.Block.toRaw()
        self.block2.physicsBody?.collisionBitMask = ColliderType.Ball.toRaw()
        self.block2.physicsBody?.contactTestBitMask = ColliderType.Ball.toRaw()
        
        
        
        
        
        
        
        //self.childNodeWithName("block")
        blockStatus["block1"] = BlockStatus(isRunning: false, timeGap: random(), currentInterval: UInt32(0))
        blockStatus["block2"] = BlockStatus(isRunning: false, timeGap: random(), currentInterval: UInt32(0))
        
        self.scoreText.text = "0"
        self.scoreText.fontSize = 42
        self.scoreText.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.blockMaxX = 0 - self.block1.size.width / 2
        
        self.addChild(block1)
        self.addChild(block2)
        self.addChild(scoreText)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        died()
    }
    
    func died(){
        if let scene = GameScene.unarchiveFromFile("GameScene") as GameScene?
        {
            let skView = self.view as SKView!
            skView.ignoresSiblingOrder = true
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            skView.presentScene(scene)
            
        }
    }
    
    func random() -> UInt32 {
        var range = UInt32(50)...UInt32(200)
        return range.startIndex + arc4random_uniform(range.endIndex - range.startIndex + 1 )
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        if onGround
        {
            self.velocityY = -18.0
            self.onGround = false
        }
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        if self.velocityY < -9.0
        {
            self.velocityY = -9.0
            
        }
    }
    override func update(currentTime: NSTimeInterval)
    {
        if self.floor.position.x <= maxBarX
        {
            self.floor.position.x = self.origFloorX
        }
        var degreeRotation = CDouble(self.groundSpeed) * M_PI / 180
        floor.position.x -= CGFloat(self.groundSpeed)
        self.ball.zRotation -= CGFloat(degreeRotation)
        
        
        self.velocityY += gravity
        self.ball.position.y -= velocityY
        
        if self.ball.position.y < self.baseline2
        {
            self.ball.position.y = self.baseline2
            velocityY = 0.0
            self.onGround = true
            
        }
        blockRunner()
    }
    func blockRunner()
    {
        for(block,blockStatus) in self.blockStatus
        {
            var thisBlock = self.childNodeWithName(block)
            if blockStatus.shouldRunBlock()
            {
                blockStatus.timeGap = random()
                blockStatus.currentInterval = 0
                blockStatus.isRunning = true
            }
            if blockStatus.isRunning
            {
                if thisBlock?.position.x > blockMaxX
                {
                    thisBlock?.position.x -=   CGFloat(self.groundSpeed)
                }
                else
                {
                thisBlock?.position.x = self.origBlockPosX
                blockStatus.isRunning = false
                self.score++
                if((self.score % 5) == 0)
                {
                    self.groundSpeed++
                }
                self.scoreText.text = String(self.score)
                }
            }
            else
            {
                blockStatus.currentInterval++
            }
            
            
        }
    }
        }
    

