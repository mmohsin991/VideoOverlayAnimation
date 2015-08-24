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
    
    class func fairy(size: CGSize,center : CGPoint, fairyDustOn : Bool, useInAVFoundation : Bool) -> CALayer{
        
        var parentLayer = CALayer()
        var rightWing = CALayer()
        var leftWing = CALayer()
        var fairyBody = CALayer()
        var fairyUpperBody = CALayer()
        var fairyLeg1 = CALayer()
        var fairyLeg2 = CALayer()
    
        let fairyWingImg = UIImage(named: "fairyWing.png")
        let fairyBodyImg = UIImage(named: "fairyBody.png")
        
        let fairyUpperBodyImg = UIImage(named: "fairyUpperBody.png")
        let fairyLeg1Img = UIImage(named: "fairyLeg1.png")
        let fairyLeg2Img = UIImage(named: "fairyLeg2.png")

        
        leftWing.contents = fairyWingImg?.CGImage
        rightWing.contents = fairyWingImg?.CGImage
        fairyBody.contents = fairyBodyImg?.CGImage

        fairyUpperBody.contents = fairyUpperBodyImg?.CGImage
        fairyLeg1.contents = fairyLeg1Img?.CGImage
        fairyLeg2.contents = fairyLeg2Img?.CGImage

        
        parentLayer.frame = CGRect(origin: CGPoint(x: center.x - size.width/2, y: center.y - size.height/2), size: size)
        // 0 == 0.38 (size.width*0)
        // 0.6 == 0.5 (size.width*0)

        var xAxis : CGFloat = 0.5
        var yAxis : CGFloat = 0.38
        var anchorPoint = CGPointMake(1,1)
        var transform = CATransform3DMakeRotation(0.1, 0, 0, 1)
        var fairyUpperBodyYAxis : CGFloat = 0.18
        // if use in AVLayer b/c the window cordinates in AVFoundaiton is starting from bottom left corner
        if useInAVFoundation {
            xAxis = 0.5
            yAxis = 0.0
            fairyUpperBodyYAxis = 0.22
            anchorPoint = CGPointMake(1,0)
            transform = CATransform3DMakeRotation(-0.1, 0, 0, 1)

        }


        
        rightWing.frame = CGRect(x: size.width*xAxis, y: size.width*yAxis, width: size.width*0.6, height: size.height*0.6)
        leftWing.frame = CGRect(x: size.width*xAxis, y: size.width*yAxis, width: size.width*0.6, height: size.height*0.6)
        fairyBody.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        fairyUpperBody.frame = CGRect(x: size.width*0.38, y: size.height*fairyUpperBodyYAxis, width: size.width*0.6, height: size.height*0.6)
        fairyLeg1.frame =  CGRect(x: size.width*xAxis, y: size.width*yAxis, width: size.width*0.6, height: size.height*0.6)
        fairyLeg2.frame =  CGRect(x: size.width*xAxis, y: size.width*yAxis, width: size.width*0.6, height: size.height*0.6)

        
        
//        rightWing.backgroundColor = UIColor.lightGrayColor().CGColor
//        leftWing.backgroundColor = UIColor.blueColor().CGColor
////        fairyBody.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.7).CGColor
        parentLayer.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.7).CGColor
//        fairyUpperBody.backgroundColor = UIColor.yellowColor().CGColor

        
        // apply the distance-mapping transform.
//        var transform = CATransform3DIdentity
//        transform.m34 = -1.0/1000.0
//        parentLayer.sublayerTransform = transform

        
        // Right wing animation
        rightWing.transform = transform
//        rightWing.anchorPoint = CGPointMake(1,1)
        rightWing.anchorPoint = anchorPoint
        let animX_R = CAKeyframeAnimation(keyPath:"transform")
        animX_R.values = [0.0,0.9,0.0]
        animX_R.additive = true
        animX_R.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)
        
        let animZ_R = CAKeyframeAnimation(keyPath:"transform")
        if useInAVFoundation {
            animZ_R.values = [0.0,-0.4,0.0]
        }else{
            animZ_R.values = [0.0,0.4,0.0]

        }
        animZ_R.additive = true

        animZ_R.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        
        let groupAnimation_R = CAAnimationGroup()
        groupAnimation_R.animations = [animX_R,animZ_R]
        groupAnimation_R.repeatCount = Float.infinity
        groupAnimation_R.duration = 0.5
        groupAnimation_R.beginTime = AVCoreAnimationBeginTimeAtZero

        rightWing.addAnimation(groupAnimation_R, forKey:nil)

        
        
        // Left wing animation
        leftWing.transform = transform
        //leftWing.anchorPoint = CGPointMake(1,1)
        leftWing.anchorPoint = anchorPoint
        let animX_L = CAKeyframeAnimation(keyPath:"transform")
        animX_L.values = [0.0,0.9,0.0]
        animX_L.additive = true
        animX_L.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)
        
        let animZ_L = CAKeyframeAnimation(keyPath:"transform")
        animZ_L.values = [0.0,0.0,0.0]
        animZ_L.additive = true
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
            //fairyDust.transform = CATransform3DMakeScale(0.5, 0.5, 1)
            parentLayer.addSublayer(fairyDust)
        }
        
        
        parentLayer.addSublayer(fairyUpperBody)
        
        parentLayer.addSublayer(leftWing)
        parentLayer.addSublayer(rightWing)
//        parentLayer.addSublayer(fairyBody)
//        parentLayer.addSublayer(fairyLeg1)
//        parentLayer.addSublayer(fairyLeg2)
        
        
        
        
        let animX_Parent = CAKeyframeAnimation(keyPath:"transform")
        animX_Parent.values = [0.0,0.9,0.0,-0.9,0.0]
        animX_Parent.additive = true
        animX_Parent.valueFunction = CAValueFunction(name: kCAValueFunctionRotateX)

        let groupAnimation_Parent = CAAnimationGroup()
        groupAnimation_Parent.animations = [animX_Parent]
        groupAnimation_Parent.repeatCount = Float.infinity
        groupAnimation_Parent.duration = 5.0
        groupAnimation_Parent.beginTime = AVCoreAnimationBeginTimeAtZero
        
        
        //parentLayer.addAnimation(groupAnimation_Parent, forKey: nil)
        
       // applyTranlationToLayer(parentLayer)
        
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