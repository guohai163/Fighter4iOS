//
//  MoveConSpriteNode.swift
//  fighter
//
//  Created by 郭海 on 2017/4/17.
//  Copyright © 2017年 GH. All rights reserved.
//

import SpriteKit

class MoveConSpriteNode : SKNode {
    
    private var isMoveTouch:Bool = true
    //实心圆
    private var movePoint : SKShapeNode = SKShapeNode(circleOfRadius: 10)
    //大空心
    private var moveController = SKShapeNode(rectOf: CGSize(width:106, height:106), cornerRadius: 53)
    
    public func setup() {
        //实心
        movePoint.fillColor = SKColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        movePoint.position = CGPoint(x: 70, y: 70)
        addChild(movePoint)
        
        moveController.lineWidth = 2
        moveController.position = CGPoint(x: 70, y: 70)
        addChild(moveController)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DLLog(message: "控制器被按下")
        for t in touches {
            isMoveTouch = true
            //取出按下坐标
            let position  = t.location(in: self)
            let x1 = position.x - 70
            let y1 = position.y - 70
            //计算是否在摇杆内,如果不在直接返回
            if abs(x1)<=15 && abs(y1)<=15 {
                return
            }
            if abs(x1) >= 35 && abs(y1) >= 35 {
                isMoveTouch = false
                return
            }
            
            var ys:CGFloat
            var xs:CGFloat
            if x1*x1 + y1*y1 > 2500 {
                //计算比例
                let z = x1 / y1
                let temp = 2500 / (1+z*z)
                ys = sqrt(temp)
                xs = abs(ys * z)
                if y1 < 0 {
                    ys = ys * -1
                }
                if x1 < 0 {
                    xs = -xs
                }
                let newPoi = CGPoint(x: 70 + xs, y: 70 + ys)
                movePoint.position = newPoi
            } else {
                let newPoi = CGPoint(x: 70 + x1, y: 70 + y1)
                movePoint.position = newPoi
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isMoveTouch {
            for t in touches {
                isMoveTouch = true
                //取出按下坐标
                let position  = t.location(in: self)
                let x1 = position.x - 70
                let y1 = position.y - 70
                //计算是否在摇杆内
                if abs(x1)<=15 && abs(y1)<=15 {
                    return
                }
                if abs(x1) >= 35 && abs(y1) >= 35 {
                    isMoveTouch = false
                    return
                }
                
                var ys:CGFloat
                var xs:CGFloat
                if x1*x1 + y1*y1 > 2500 {
                    let z = x1 / y1
                    let temp = 2500 / (1+z*z)
                    ys = sqrt(temp)
                    xs = abs(ys * z)
                    if y1 < 0 {
                        ys = ys * -1
                    }
                    if x1 < 0 {
                        xs = -xs
                    }
                    let newPoi = CGPoint(x: 70 + xs, y: 70 + ys)
                    movePoint.position = newPoi
                } else {
                    let newPoi = CGPoint(x: 70 + x1, y: 70 + y1)
                    movePoint.position = newPoi
                }
                
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        movePoint.position = CGPoint(x: 70, y: 70)
    }
    
    //返回控制点相对偏移量
    public func MovePosition() -> CGPoint {
        return CGPoint(x: movePoint.position.x - 70, y: movePoint.position.y - 70)
        
    }
}
