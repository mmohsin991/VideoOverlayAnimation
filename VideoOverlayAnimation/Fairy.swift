//
//  Fairy.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 20/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit


class FairyLayer: CALayer {
    
    
    override func drawInContext(ctx: CGContext!) {
        
        var rightWing = CALayer()
        var leftWing = CALayer()
        var fairyBody = CALayer()
        
        let fairyWingImg = UIImage(named: "fairyWing.png")
        let fairyBodyImg = UIImage(named: "fairyBody.png")

        rightWing.contents = fairyWingImg?.CGImage
        fairyBody.contents = fairyBodyImg?.CGImage
        
        
        self.addSublayer(rightWing)
        self.addSublayer(fairyBody)
        
    }
    
}



class Fairy {
    
    class func fairy() -> CALayer{
        
        var parentLayer = CALayer()
        var rightWing = CALayer()
        var leftWing = CALayer()
        var fairyBody = CALayer()
    
        let fairyWingImg = UIImage(named: "fairyWing.png")
        let fairyBodyImg = UIImage(named: "fairyBody.png")
        
        
        rightWing.contents = fairyWingImg?.CGImage
        fairyBody.contents = fairyBodyImg?.CGImage
        
        let size = CGSize(width: 100, height: 100)
        
        parentLayer.frame = CGRect(origin: CGPointZero, size: size)
        rightWing.frame = CGRect(x: size.width*0.5, y: size.width*0.4, width: size.width*0.6, height: size.height*0.6)
        fairyBody.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        
        
        rightWing.backgroundColor = UIColor.lightGrayColor().CGColor
//        fairyBody.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.7).CGColor
        parentLayer.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.7).CGColor
        
        
 //       rightWing.anchorPoint = CGPointMake(0,1)
//        rightWing.transform = CATransform3DMakeRotation(0.9, 0, 0, 1)
        
        
        // apply the distance-mapping transform.
//        var transform = CATransform3DIdentity
//        transform.m34 = -1.0/1000.0
//        parentLayer.sublayerTransform = transform
//
//        let rightWingAnimation = CAKeyframeAnimation(keyPath: "transfor.rotate")
//        
//        rightWingAnimation.duration = 1
//        rightWingAnimation.repeatCount = 100


        rightWing.anchorPoint = CGPointMake(1,1)
        let animX = CAKeyframeAnimation(keyPath:"transform")
        animX.values = [0.2,0.5,0.8]
        animX.additive = true
        animX.duration = 2.0
        
        animX.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)
        
        let animY = CAKeyframeAnimation(keyPath:"transform")
        animY.values = [0.2,0.5,0.8]
        animY.additive = true
        animY.duration = 2.0
        
        animY.valueFunction = CAValueFunction(name: kCAValueFunctionRotateY)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [animX,animY]
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.duration = 2.0
        
        rightWing.addAnimation(groupAnimation, forKey:nil)

        
        
        
        
        
        
        
        
        parentLayer.addSublayer(rightWing)
        parentLayer.addSublayer(fairyBody)
        
        
        return parentLayer
    }
}