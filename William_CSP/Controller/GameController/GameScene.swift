//
//  GameScene.swift
//  Sample_CSP
//
//  Created by Cody Henrichsen on 12/6/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion

public class GameScene: SKScene, SKPhysicsContactDelegate
{
    //MARK: Invader Data
    let rowsOfInvaders : Int = 4
    var invaderSpeed : Double = 30
    var invadersThatCanFire : [Invader] = []
    
    //MARK: Player Data
    var player : Player = Player()
    
    //MARK: Game Data
    let leftBounds : CGFloat = 30
    var rightBounds : CGFloat = 0
    
    let maxLevels = 3
    let motionManager: CMMotionManager = CMMotionManager()
    var accelerationX: CGFloat = 0.0
    
    //MARK:- Game Methods
    
    private func setupInvaders() -> Void
    {
        let numberOfInvaders = gameLevel * 2 + 1
        for invaderRow in 0..<numberOfInvaders
        {
            for invaderCol in 0..<numberOfInvaders
            {
                let currentInvader :Invader = Invader()
                let halfWidth : CGFloat = currentInvader.size.width / 2
                let xPosition : CGFloat = size.width - halfWidth - (CGFloat(numberOfInvaders) * currentInvader.size.width) + 10
                
                currentInvader.position = CGPoint(x: xPosition + (currentInvader.size.width + CGFloat(10)) * CGFloat(invaderCol - 1), y: CGFloat(self.size.height - CGFloat(invaderRow) * 46))
                currentInvader.invaderRow = invaderRow
                currentInvader.invaderCol = invaderCol
                
                addChild(currentInvader)
                if (invaderRow == rowsOfInvaders)
                {
                    invadersThatCanFire.append(currentInvader)
                }
            }
        }
        
        
    }

    private func setupPlayer() -> Void
    {
        //Frame or bounds
        player.position = CGPoint(x:self.frame.midX, y:player.size.height/2 + 10)
        addChild(player)
    }
    
    private func moveInvaders() -> Void
    {
        var changeDirection = false
        enumerateChildNodes(withName: "invader")
        {
            //Closure parameters
            node, stop in
            let invader = node as! SKSpriteNode
            let invaderHalfWidth = invader.size.width / 2
            invader.position.x -= CGFloat(self.invaderSpeed)
            if(invader.position.x > self.rightBounds - invaderHalfWidth || invader.position.x < self.leftBounds + invaderHalfWidth)
            {
                changeDirection = true
            }
            
        }
        
        if(changeDirection == true)
        {
            self.invaderSpeed *= -1
            self.enumerateChildNodes(withName: "invader")
            {
                node, stop in
                let invader = node as! SKSpriteNode
                invader.position.y -= CGFloat(10)
            }
            changeDirection = false
        }
        
    }
    
    private func invokeInvaderFire() -> Void
    {
        
    }
    
    func fireInvaderBullet() -> Void
    {
       
    }
    
    func newGame() -> Void
    {
        
    }
    
    func levelComplete() -> Void
    {
        
    }
    
    
    //MARK:- Scene methods
    
    override public func didMove(to view: SKView) -> Void
    {
        self.physicsWorld.gravity = CGVector(dx:0, dy:0)
        self.physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        
        backgroundColor = UIColor.black
        let starField = SKEmitterNode(fileNamed: "StarField")
        addChild(starField!)
        rightBounds = self.size.width - 30
        setupInvaders()
        setupPlayer()
        invokeInvaderFire()
        setupAccelerometer()
        
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) -> Void
    {
        player.fireBullet(scene: self)
    }
    
    override public func update(_ currentTime: CFTimeInterval) -> Void
    {
        moveInvaders()
    }
    
    override public func didSimulatePhysics()
    {
        
    }

    //MARK:- Handle Motion
    func setupAccelerometer() -> Void
    {
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!, withHandler:
            {
                (accelerometerData: CMAccelerometerData?, error: Error?)
                in
                    let acceleration = accelerometerData!.acceleration
                    self.accelerationX = CGFloat(acceleration.x)
                } )
    }
    
    
    //MARK:- SKPhysicsContactDelegate method
    
    public func didBegin(_ contact: SKPhysicsContact) -> Void
    {
        
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask
        {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }
        else
        {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if((firstBody.categoryBitMask & CollisionCategories.Invader != 0) && (secondBody.categoryBitMask & CollisionCategories.PlayerBullet != 0))
        {
            print("Invader and Player Bullet Contact")
        }
        
        if((firstBody.categoryBitMask & CollisionCategories.Invader != 0) && (secondBody.categoryBitMask & CollisionCategories.InvaderBullet != 0))
        {
            print("Player and Invader Bullet Contact")
        }
        
        if((firstBody.categoryBitMask & CollisionCategories.Invader != 0) && (secondBody.categoryBitMask & CollisionCategories.Player != 0))
        {
            print("Invader and Player Collision Contact")
        }
    }
    
}
