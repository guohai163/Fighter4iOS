//
//  FighterSpriteNode.swift
//  fighter
//
//  Created by 郭海 on 2017/4/17.
//  Copyright © 2017年 GH. All rights reserved.
//

import SpriteKit

class FighterSpriteNode : SKSpriteNode {
    
    //因为我们的主角只有一个，所以 我们来一个单例模式 
    public static func newInstance() -> FighterSpriteNode {
        
        let fighter = FighterSpriteNode(imageNamed: "fighter")
        
        return fighter
    }
}
