//
//  Fairy.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 20/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit
import AVFoundation


enum TFFairySize{
    case Small
    case Medium
    case Large
}


class Fairy {
    
    class func fairy(size: CGSize,center : CGPoint, fairyDustOn : Bool) -> CALayer{
        
        var parentLayer = CALayer()
        var rightWing = CALayer()
        var leftWing = CALayer()
        var fairyBody = CALayer()
    
        let fairyWingImg = UIImage(named: "fairyWing.png")
        let fairyBodyImg = UIImage(named: "fairyBody.png")
        
        leftWing.contents = fairyWingImg?.CGImage
        rightWing.contents = fairyWingImg?.CGImage
        fairyBody.contents = fairyBodyImg?.CGImage
        
        parentLayer.frame = CGRect(origin: CGPoint(x: center.x - size.width/2, y: center.y - size.height/2), size: size)
        // 0 == 0.38 (size.width*0)
        // 0.6 == 0.5 (size.width*0)

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
//        rightWing.anchorPoint = CGPointMake(1,0)
        rightWing.anchorPoint = CGPointMake(1,1)
        let animX_R = CAKeyframeAnimation(keyPath:"transform")
        animX_R.values = [0.0,0.9,0.0]
        animX_R.additive = true
        animX_R.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)
        
        let animZ_R = CAKeyframeAnimation(keyPath:"transform")
        animZ_R.values = [0.0,0.4,0.0]
        animZ_R.additive = true

        animZ_R.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        let groupAnimation_R = CAAnimationGroup()
        groupAnimation_R.animations = [animX_R,animZ_R]
        groupAnimation_R.repeatCount = Float.infinity
        groupAnimation_R.duration = 0.5
        groupAnimation_R.beginTime = AVCoreAnimationBeginTimeAtZero

        rightWing.addAnimation(groupAnimation_R, forKey:nil)

        
        
        // Left wing animation
        leftWing.transform = CATransform3DMakeRotation(0.1, 0, 0, 1)
        //leftWing.anchorPoint = CGPointMake(1,0)
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
        groupAnimation_L.beginTime = AVCoreAnimationBeginTimeAtZero

        
        leftWing.addAnimation(groupAnimation_L, forKey: nil)

        
        
        // fairy dust
        if fairyDustOn{
            let dustEmittingPoint = CGPoint(x: size.width/1.4, y: size.height/2)
            let fairyDust = TFFairyDust.fairyDust(dustEmittingPoint)
            parentLayer.addSublayer(fairyDust)
        }
        
        parentLayer.addSublayer(leftWing)
        parentLayer.addSublayer(rightWing)
        parentLayer.addSublayer(fairyBody)
        
        
        applyTranlationToLayer(parentLayer)
        
        return parentLayer
    }
    
    
    
    private class func applyTranlationToLayer(layer : CALayer){
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 16))
        
        path.addCurveToPoint(CGPoint(x: 300, y: 200), controlPoint1: CGPoint(x: 16, y: 400), controlPoint2: CGPoint(x: 300, y: 500))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        anim.beginTime = AVCoreAnimationBeginTimeAtZero
        
        
        
        // we add the animation to the squares 'layer' property
        layer.addAnimation(anim, forKey: nil)
        
    }
}