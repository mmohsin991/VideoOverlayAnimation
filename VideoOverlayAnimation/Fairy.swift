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
    
    class func fairy(size: CGSize) -> CALayer{
        
        var parentLayer = CALayer()
        var rightWing = CALayer()
        var leftWing = CALayer()
        var fairyBody = CALayer()
    
        let fairyWingImg = UIImage(named: "fairyWing.png")
        let fairyBodyImg = UIImage(named: "fairyBody.png")
        
        leftWing.contents = fairyWingImg?.CGImage
        rightWing.contents = fairyWingImg?.CGImage
        fairyBody.contents = fairyBodyImg?.CGImage
        
        parentLayer.frame = CGRect(origin: CGPoint(x: -size.height/2, y: -size.height/2.6), size: size)
        rightWing.frame = CGRect(x: size.width*0.5, y: size.width*0.38, width: size.width*0.6, height: size.height*0.6)
        leftWing.frame = CGRect(x: size.width*0.5, y: size.width*0.38, width: size.width*0.6, height: size.height*0.6)
        fairyBody.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)

        
        
//        rightWing.backgroundColor = UIColor.lightGrayColor().CGColor
//        leftWing.backgroundColor = UIColor.blueColor().CGColor
//        fairyBody.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.7).CGColor
//        parentLayer.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.7).CGColor
        
        
        // apply the distance-mapping transform.
//        var transform = CATransform3DIdentity
//        transform.m34 = -1.0/1000.0
//        parentLayer.sublayerTransform = transform

        
        // Right wing animation
        rightWing.transform = CATransform3DMakeRotation(0.1, 0, 0, 1)
        rightWing.anchorPoint = CGPointMake(1,1)
        let animX_R = CAKeyframeAnimation(keyPath:"transform")
        animX_R.values = [0.0,0.9,0.0]
        animX_R.additive = true
        animX_R.rotationMode = kCAAnimationRotateAutoReverse
        animX_R.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)
        
        let animZ_R = CAKeyframeAnimation(keyPath:"transform")
        animZ_R.values = [0.0,0.4,0.0]
        animZ_R.additive = true
        animZ_R.rotationMode = kCAAnimationRotateAutoReverse

        animZ_R.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        let groupAnimation_R = CAAnimationGroup()
        groupAnimation_R.animations = [animX_R,animZ_R]
        groupAnimation_R.repeatCount = Float.infinity
        groupAnimation_R.duration = 0.5
        
        rightWing.addAnimation(groupAnimation_R, forKey:nil)

        
        
        // Left wing animation
        leftWing.transform = CATransform3DMakeRotation(0.1, 0, 0, 1)
        leftWing.anchorPoint = CGPointMake(1,1)
        
        let animX_L = CAKeyframeAnimation(keyPath:"transform")
        animX_L.values = [0.0,0.9,0.0]
        animX_L.additive = true
        animX_L.rotationMode = kCAAnimationRotateAutoReverse
        
        animX_L.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)
        
        let animZ_L = CAKeyframeAnimation(keyPath:"transform")
        animZ_L.values = [0.0,0.0,0.0]
        animZ_L.additive = true
        animZ_L.rotationMode = kCAAnimationRotateAutoReverse
        
        animZ_L.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        let groupAnimation_L = CAAnimationGroup()
        groupAnimation_L.animations = [animX_L,animZ_L]
        groupAnimation_L.repeatCount = Float.infinity
        groupAnimation_L.duration = 0.5
    
        leftWing.addAnimation(groupAnimation_L, forKey: nil)

        
        parentLayer.addSublayer(leftWing)
        parentLayer.addSublayer(rightWing)
        parentLayer.addSublayer(fairyBody)
        
        
        return parentLayer
    }
}