//
//  GameScene.swift
//  fighter
//
//  Created by 郭海 on 2017/4/16.
//  Copyright © 2017年 GH. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    //声明背景类
    private let backgroundNode = BackgroundNode()
    //我们目前先不实例化
    private var fighterNode : FighterSpriteNode!
    
    private let moveCon = MoveConSpriteNode()
    
    override func sceneDidLoad() {
        
        
        //加入背景NODE
        backgroundNode.setup(size: size)
        addChild(backgroundNode)
        
        //加载战斗机
        spawnFighter()
        
        //加载控制器
        moveCon.setup()
        addChild(moveCon)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveCon.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveCon.touchesMoved(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        moveCon.touchesEnded(touches, with: event)
    }
    
    override func update(_ currentTime: TimeInterval) {
        //获取摇杆偏移量
        let poi = moveCon.MovePosition()
        //增加小飞机动画飞往目标位置
        let moveAction = SKAction.move(to: CGPoint(x: fighterNode.position.x + poi.x,y: fighterNode.position.y + poi.y), duration: 0.1)
        fighterNode.run(moveAction)
        
    }
    
    private func spawnFighter() {
        
        //当飞机被击毁后重新加载飞机使用
        if let currentFighter = fighterNode, children.contains(currentFighter) {
            fighterNode.removeFromParent()
            fighterNode.removeAllActions()
            fighterNode.physicsBody = nil
        }
        //初始化我们的小飞机
        fighterNode = FighterSpriteNode.newInstance()
        //决定我们飞机的位置 ，左屏幕右侧出现
        fighterNode.position = CGPoint(x: 100, y: size.height/2)
        
        addChild(fighterNode)
        
        
    }
    
}
