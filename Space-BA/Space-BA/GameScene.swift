//
//  GameScene.swift
//  Space-BA
//
//  Created by Sandeep on 9/22/14.
//  Copyright (c) 2014 Sandeep. All rights reserved.
//

import SpriteKit

class GameScene: SKScene ,SKPhysicsContactDelegate
{
    
    var player:SKSpriteNode = SKSpriteNode()
    var lastYieldTimeInterval:NSTimeInterval = NSTimeInterval()
    var lastUpdateTimeInterval = NSTimeInterval()
    
    var aliensDestroyed:Int = 0

    let alienCategory:UInt32 = 0x1 << 1
    let torpedoCategory:UInt32 = 0x1 << 0
    
 
    
    override func didMoveToView(view: SKView)
    {/*
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)*/
        
        
    }
    
      override  init(size: CGSize)
    {
        super.init(size: size)
        self.backgroundColor = SKColor.blackColor()
        player = SKSpriteNode(imageNamed: "shuttle")
        
        
        player.position = CGPointMake(self.frame.size.width / 2 , player.size.height/2 + 20 )
        
        self.addChild(player)
        
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        
        self.physicsWorld.contactDelegate = self
    }

      required init(coder aDecoder: NSCoder) {    super.init(coder: aDecoder)      }
    
    func addAlien()
    {
        var alien = SKSpriteNode(imageNamed: "alien")
        alien.physicsBody = SKPhysicsBody(circleOfRadius: alien.size.width/2)
        alien.physicsBody?.dynamic = true
        
        alien.physicsBody?.categoryBitMask = alienCategory
        alien.physicsBody?.contactTestBitMask = torpedoCategory
        alien.physicsBody?.collisionBitMask = 0
        
        let position = randomXPosition(alien)
    
        alien.position = CGPointMake( position , self.frame.size.height - 20 )
        
        let minDuration = 2
        let maxDuration = 4
        let rangeDuration = maxDuration - minDuration
        let duration = Int(arc4random()) % rangeDuration + minDuration
        
        var actionArray:NSMutableArray = NSMutableArray()
        actionArray.addObject(SKAction.moveTo(CGPointMake(position , -alien.size.height) , duration: NSTimeInterval(duration)))
        actionArray.addObject(SKAction.runBlock({ () -> Void in
            var transition = SKTransition.flipHorizontalWithDuration(0.5)
            var gameOverScene:SKScene = GameOver(size: self.size, won: false)
            self.view?.presentScene(gameOverScene, transition: transition)
        }))
        actionArray.addObject(SKAction.removeFromParent())
        
        alien.runAction(SKAction.sequence(actionArray))
        
        self.addChild(alien)
        
        
        println("ADD ALIEN")                                                            //DEBUG
    }
    
    
    
    
    
    
    func randomXPosition(inputNode:SKSpriteNode)->CGFloat
    {
        
        let minX = inputNode.size.width/2
        let maxX = self.frame.size.width - inputNode.size.width/2
        let range = maxX - minX
        let position:CGFloat = CGFloat(arc4random()) % range + minX
        return position
    }
    
    
    
    
    
    
    
    
    
    func updateWithTimeSinceLastUpdate(timeSinceLastUpdate:CFTimeInterval)
    {
        lastYieldTimeInterval += timeSinceLastUpdate
        if(lastYieldTimeInterval > 1 )
        {
            lastYieldTimeInterval = 0
            addAlien()
        }
        
        
        
    }
    
    
    
    
    
    
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent)
    {
        self.runAction(SKAction.playSoundFileNamed("torpedo.mp3", waitForCompletion: false))
        
        var touch:UITouch = touches.anyObject() as UITouch
        var location = touch.locationInNode(self)
        
        var torpedo = SKSpriteNode(imageNamed: "torpedo")
        torpedo.position = player.position
        
        torpedo.physicsBody = SKPhysicsBody(circleOfRadius: torpedo.size.width/2)
        torpedo.physicsBody?.dynamic = true
        torpedo.physicsBody?.categoryBitMask = torpedoCategory
        torpedo.physicsBody?.collisionBitMask = 0
        torpedo.physicsBody?.contactTestBitMask = alienCategory
        
        torpedo.physicsBody?.usesPreciseCollisionDetection = true
        
        var offset:CGPoint = vecSub(location , b:torpedo.position)
        
        if(offset.y < 0 )
        {
            return
        }
        self.addChild(torpedo)
        var direction = vecNormalize(offset)
        var shotLength:CGPoint = vecMult(direction, b: 1000)
        
        var finalDestination:CGPoint = vecAdd(shotLength, b: torpedo.position)
        
        let velocity = 568/1
        let moveDuration:Float = Float(self.size.width) / Float(velocity)
        
        var actionArray:NSMutableArray = NSMutableArray()
        
        actionArray.addObject(SKAction.moveTo(finalDestination, duration: NSTimeInterval(moveDuration)))
        
        actionArray.addObject(SKAction.removeFromParent())
        
        torpedo.runAction(SKAction.sequence(actionArray))
        
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody:SKPhysicsBody
        var secondBody:SKPhysicsBody
        
        if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
        {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            
        }
        
        if((firstBody.categoryBitMask & torpedoCategory) != 0 && (secondBody.categoryBitMask & alienCategory) != 0 )
        {
            torpedoDiDCollideWithAlien(firstBody.node as SKSpriteNode, alien: secondBody.node as SKSpriteNode)
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func torpedoDiDCollideWithAlien(torpedo:SKSpriteNode,alien:SKSpriteNode)
    {
        println("HHIT")
        torpedo.removeFromParent()
        alien.removeFromParent()
        
        aliensDestroyed++
        
        if(aliensDestroyed > 10 )
        {
            var transition = SKTransition.flipHorizontalWithDuration(0.5)
            var gameOverScene:SKScene = GameOver(size: self.size, won: true)
            self.view?.presentScene(gameOverScene, transition: transition)        }
    }
        
        
        
    override func update(currentTime: CFTimeInterval)
    {
       var timeSinceLastUpdate = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        
        if(timeSinceLastUpdate > 1)
        {
            timeSinceLastUpdate = 1/60
            lastUpdateTimeInterval = currentTime
        }
        
        updateWithTimeSinceLastUpdate(timeSinceLastUpdate)
        
    //    println(timeSinceLastUpdate)                                     //DEBUG

      //  println(lastUpdateTimeInterval)                                           //DEBUG
      //  println(currentTime)                                                       //DEBUG
        
        
    }
    
    
    func vecAdd(a:CGPoint,b:CGPoint) ->CGPoint
    {
        return CGPointMake(a.x + b.x, a.y + b.y)
    }
    
    func vecSub(a:CGPoint,b:CGPoint) ->CGPoint
    {
        return CGPointMake(a.x - b.x, a.y - b.y)
    }
    
    func vecMult(a:CGPoint,b:CGFloat)->CGPoint
    {
        return CGPointMake(a.x*b, a.y*b)
    }
    
    func vecLength(a:CGPoint)->CGFloat
    {
        return CGFloat( sqrt(a.x*a.x + a.y*a.y))
    }
    
    func vecNormalize(a:CGPoint)->CGPoint
    {
        var length = vecLength(a)
        return CGPointMake(a.x / length , a.y / length)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
