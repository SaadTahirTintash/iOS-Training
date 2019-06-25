//
//  TickleGestureRecognizer.swift
//  MonkeyPinch
//
//  Created by Tintash on 25/06/2019.
//  Copyright © 2019 Ray Wenderlich. All rights reserved.
//

import UIKit

class TickleGestureRecognizer: UIGestureRecognizer {
    let requiredTickles = 2
    let distanceForTickleGesture : CGFloat = 25.0
    
    enum Direction: Int{
        case DirectionUnknown = 0
        case DirectionLeft
        case DirectionRight
    }
    
    var tickleCount = 0
    var curTickleStart: CGPoint = CGPoint.zero
    var lastDirection: Direction = .DirectionUnknown
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touch = touches.first{
            self.curTickleStart = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        if let touch = touches.first{
            let ticklePoint = touch.location(in: self.view)
            
            let moveAmt = ticklePoint.x - curTickleStart.x
            let curDirection: Direction = moveAmt < 0 ? Direction.DirectionLeft : Direction.DirectionRight
            
            if abs(moveAmt) < self.distanceForTickleGesture{
                return
            }
            
            if self.lastDirection == .DirectionUnknown || (self.lastDirection == .DirectionLeft && curDirection == .DirectionRight) || (self.lastDirection == .DirectionRight && curDirection == .DirectionLeft){
                self.tickleCount += 1
                self.curTickleStart = ticklePoint
                self.lastDirection = curDirection
                
                if self.state == .possible && self.tickleCount > self.requiredTickles{
                    self.state = .ended
                }
            }
        }
    }
    
    override func reset() {
        self.tickleCount = 0
        self.curTickleStart = CGPoint.zero
        self.lastDirection = .DirectionUnknown
        if self.state == .possible{
            self.state = .failed
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        self.reset()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        self.reset()
    }
}
