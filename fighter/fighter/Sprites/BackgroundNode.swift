//
//  BackgroundNode.swift
//  fighter
//
//  Created by 郭海 on 2017/4/17.
//  Copyright © 2017年 GH. All rights reserved.
//

import SpriteKit

class BackgroundNode : SKNode {
    
    public func setup (size : CGSize) {
        
        //创建一个天空
        let skyNode = SKShapeNode(rect: CGRect(origin: CGPoint(), size: size))
        skyNode.fillColor = SKColor(red: 0, green: 0.5, blue: 1, alpha: 1)
        skyNode.strokeColor = SKColor.clear
        skyNode.zPosition = 0
        
        addChild(skyNode)
    }
}
