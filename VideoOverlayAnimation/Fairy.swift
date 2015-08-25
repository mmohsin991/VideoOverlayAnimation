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

enum TFFairyColors{
    case White
    case Yellow
    case Pink
}

let kDegToRad : CGFloat = 0.0174532925

class Fairy {
    
    class func fairy(fairySize: TFFairySize, fairyColor: TFFairyColors, center : CGPoint, fairyDustOn : Bool, useInAVFoundation : Bool, animationDuration: Double, environmentSize: CGSize) -> CALayer{
        
        println(animationDuration)
        
        var parentLayer = CALayer()
        var rightWing = CALayer()
        var leftWing = CALayer()
        var fairyBody = CALayer()
        var fairyUpperBody = CALayer()
        var fairyLeg1 = CALayer()
        var fairyLeg2 = CALayer()
        var size = CGSize(width: 100, height: 100)
        let fairyBodyImg = UIImage(named: "fairyBody.png")
        
        var fairyWingImg = UIImage(named: "fairyWing.png")
        var fairyUpperBodyImg = UIImage(named: "fairyUpperBody.png")
        var fairyLeg1Img = UIImage(named: "fairyLeg1.png")
        var fairyLeg2Img = UIImage(named: "fairyLeg2.png")
        
        if fairyColor == TFFairyColors.Yellow{
            fairyWingImg = UIImage(named: "fairyWingYellow.png")
            fairyUpperBodyImg = UIImage(named: "fairyUpperBodyYellow.png")
            fairyLeg1Img = UIImage(named: "fairyLeg1Yellow.png")
            fairyLeg2Img = UIImage(named: "fairyLeg2Yellow.png")
        }
        else if fairyColor == TFFairyColors.Pink{
            fairyWingImg = UIImage(named: "fairyWingPink.png")
            fairyUpperBodyImg = UIImage(named: "fairyUpperBodyPink.png")
            fairyLeg1Img = UIImage(named: "fairyLeg1Pink.png")
            fairyLeg2Img = UIImage(named: "fairyLeg2Pink.png")
        }

    
        //MARK: set for UIView or AVFoundation
        var xAxis : CGFloat = 0.5
        var yAxis : CGFloat = 0.38
        var anchorPoint = CGPointMake(1,1)
        var transform = CATransform3DMakeRotation(0.1, 0, 0, 1)
        var fairyUpperBodyYAxis : CGFloat = 0.17
        var fairyLegsYAxis : CGFloat = 0.56
        var fairyLeg1AnchorPoint = CGPointMake(0.93,0.62)
        var fairyLeg2AnchorPoint = CGPointMake(0.77,0.91)
        // if use in AVLayer b/c the window cordinates in AVFoundaiton is starting from bottom left corner
        if useInAVFoundation {
            xAxis = 0.5
            yAxis = 0.0
            fairyUpperBodyYAxis = 0.18
            fairyLegsYAxis = 0.09
            fairyLeg1AnchorPoint = CGPointMake(0.93,0.38)
            fairyLeg2AnchorPoint = CGPointMake(0.77,0.09)
            anchorPoint = CGPointMake(1,0)
            transform = CATransform3DMakeRotation(-0.1, 0, 0, 1)
            
        }

        
        
        leftWing.contents = fairyWingImg?.CGImage
        rightWing.contents = fairyWingImg?.CGImage
        fairyBody.contents = fairyBodyImg?.CGImage

        fairyUpperBody.contents = fairyUpperBodyImg?.CGImage
        fairyLeg1.contents = fairyLeg1Img?.CGImage
        fairyLeg2.contents = fairyLeg2Img?.CGImage

        switch(fairySize){
        case .Small:
             size = CGSize(width: 100, height: 100)
        case .Medium:
             size = CGSize(width: 150, height: 150)
        case .Large:
             size = CGSize(width: 200, height: 200)
        }
        
        
        
//        parentLayer.frame = CGRect(origin: CGPoint(x: center.x - size.width/2, y: center.y - size.height/2), size: size)
        
        println("environmentSize: \(environmentSize)")
        parentLayer.frame = CGRect(origin: CGPoint(x: environmentSize.width*0.0-(size.width/2),y: environmentSize.height*0.5-(size.height/2)), size: size)
        
        
        
        rightWing.frame = CGRect(x: size.width*xAxis, y: size.width*yAxis, width: size.width*0.6, height: size.height*0.6)
        leftWing.frame = CGRect(x: size.width*xAxis, y: size.width*yAxis, width: size.width*0.6, height: size.height*0.6)
        fairyBody.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        fairyUpperBody.frame = CGRect(x: size.width*0.34, y: size.height*fairyUpperBodyYAxis, width: size.width*0.65, height: size.height*0.65)
        fairyLeg1.frame =  CGRect(x: size.width*0.20, y: size.width*fairyLegsYAxis, width: size.width*0.35, height: size.height*0.35)
        fairyLeg2.frame =  CGRect(x: size.width*0.20, y: size.width*fairyLegsYAxis, width: size.width*0.35, height: size.height*0.35)

        
        
//        rightWing.backgroundColor = UIColor.lightGrayColor().CGColor
//        leftWing.backgroundColor = UIColor.blueColor().CGColor
////        fairyBody.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.7).CGColor
//        parentLayer.backgroundColor = UIColor.greenColor().colorWithAlphaComponent(0.7).CGColor
//        fairyUpperBody.backgroundColor = UIColor.yellowColor().CGColor
//        fairyLeg1.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.7).CGColor

        
        // apply the distance-mapping transform.
//        var transform = CATransform3DIdentity
//        transform.m34 = -1.0/1000.0
//        parentLayer.sublayerTransform = transform

        
        //MARK: Right wing animation
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

        
        
        //MARK: Left wing animation
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

        
        
        //MARK: fairy Leg1 animation
        fairyLeg1.anchorPoint = fairyLeg1AnchorPoint
        
        let animZ_Leg1 = CAKeyframeAnimation(keyPath:"transform")
        if useInAVFoundation {
            animZ_Leg1.values = [0.0,(30*kDegToRad),0.0]
        }else{
            animZ_Leg1.values = [0.0,-(30*kDegToRad),0.0]
        }
        animZ_Leg1.additive = true
        animZ_Leg1.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animZ_Leg1.repeatCount = Float.infinity
        animZ_Leg1.duration = 1.0
        animZ_Leg1.beginTime = AVCoreAnimationBeginTimeAtZero
        
        fairyLeg1.addAnimation(animZ_Leg1, forKey: nil)
        
        
        
        //MARK: fairy Leg2 animation
        fairyLeg2.anchorPoint = fairyLeg2AnchorPoint
        let animZ_Leg2 = CAKeyframeAnimation(keyPath:"transform")
        if useInAVFoundation {
            fairyLeg2.transform = CATransform3DMakeRotation((50*kDegToRad), 0, 0, 1)
            animZ_Leg2.values = [0.0,-(30*kDegToRad),0.0]

        }else{
            fairyLeg2.transform = CATransform3DMakeRotation(-(50*kDegToRad), 0, 0, 1)
            animZ_Leg2.values = [0.0,(30*kDegToRad),0.0]
        }
        animZ_Leg2.additive = true
        animZ_Leg2.valueFunction = CAValueFunction(name: kCAValueFunctionRotateZ)
        animZ_Leg2.repeatCount = Float.infinity
        animZ_Leg2.duration = 1.0
        animZ_Leg2.beginTime = AVCoreAnimationBeginTimeAtZero
        
        fairyLeg2.addAnimation(animZ_Leg2, forKey: nil)
        
        
        //MARK: fairy dust
        if fairyDustOn{
            let dustEmittingPoint = CGPoint(x: size.width/1.4, y: size.height/2)
            let fairyDust = TFFairyDust.fairyDust(dustEmittingPoint)
            //fairyDust.transform = CATransform3DMakeScale(0.5, 0.5, 1)
            //fairyDust.scale = 2.0
            parentLayer.addSublayer(fairyDust)
        }
        
        
        
        parentLayer.addSublayer(leftWing)
        parentLayer.addSublayer(rightWing)
//        parentLayer.addSublayer(fairyBody)
        parentLayer.addSublayer(fairyLeg1)
        parentLayer.addSublayer(fairyLeg2)
        
        parentLayer.addSublayer(fairyUpperBody)

        
        
        //MARK: parent layer animation
        
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
        
        
        
        
        // MARK: animation path
        
        TFToothFairyPaths.applyPath2ToLayer(parentLayer, animationDuration: animationDuration, size: environmentSize)
        
        
        
        return parentLayer
    }
    
}