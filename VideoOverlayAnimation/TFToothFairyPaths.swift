//
//  TFToothFairyPaths.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 24/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit
import AVFoundation

class TFToothFairyPaths {
    
    class func applyPath1ToLayer(layer : CALayer, animationDuration: Double, size: CGSize){
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 16))
        
        path.addCurveToPoint(CGPoint(x: 300, y: 200), controlPoint1: CGPoint(x: 16, y: 400), controlPoint2: CGPoint(x: 300, y: 500))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = animationDuration
        anim.beginTime = AVCoreAnimationBeginTimeAtZero

        
        // we add the animation to the squares 'layer' property
        layer.addAnimation(anim, forKey: nil)
        
    }
    
    
    class func applyPath2ToLayer(layer : CALayer, animationDuration: Double, size: CGSize){
        
        
//        let path = UIBezierPath()
//        path.moveToPoint(CGPoint(x: size.width*0.0,y: size.height*0.1))
//        path.addCurveToPoint(
//            CGPoint(x: size.width*0.8,y: size.height*0.2),
//            controlPoint1: CGPoint(x: size.width*2.0,y: size.height*1.2),
//            controlPoint2: CGPoint(x: -size.width*1.0,y: size.height*1.1))
        
        
        
        
        
        var pathPoints = [
            CGPoint(x: size.width*0.0,y: size.height*0.1),
            CGPoint(x: size.width*0.8,y: size.height*0.2),
            CGPoint(x: size.width*0.8,y: size.height*0.3),
            CGPoint(x: size.width*0.2,y: size.height*0.4),
            CGPoint(x: size.width*0.2,y: size.height*0.5),
        ]
        var controllPoints = [
            CGPoint(x: size.width*0.5,y: size.height*0.0),
            CGPoint(x: size.width*1.0,y: size.height*0.285),
            CGPoint(x: size.width*0.5,y: size.height*0.3),
            CGPoint(x: size.width*0.0,y: size.height*0.45),
        ]
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: size.width*0.0,y: size.height*0.1))
        path.addQuadCurveToPoint(pathPoints[1], controlPoint: controllPoints[0])
        path.addQuadCurveToPoint(pathPoints[2], controlPoint: controllPoints[1])
        path.addQuadCurveToPoint(pathPoints[3], controlPoint: controllPoints[2])
        path.addQuadCurveToPoint(pathPoints[4], controlPoint: controllPoints[3])
        
        
        //            path.addCurveToPoint(
        //                CGPoint(x: size.width*0.8,y: size.height*0.2),
        //                controlPoint1: CGPoint(x: size.width*2.0,y: size.height*1.2),
        //                controlPoint2: CGPoint(x: -size.width*1.0,y: size.height*1.1))
        
        path.lineJoinStyle = kCGLineJoinRound
        
        
        
        
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        //anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = animationDuration
        anim.beginTime = AVCoreAnimationBeginTimeAtZero
        
        
        // we add the animation to the squares 'layer' property
        layer.addAnimation(anim, forKey: nil)
        
    }
}