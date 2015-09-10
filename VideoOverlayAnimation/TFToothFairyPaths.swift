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
        
        
        let path = UIBezierPath()
        path.lineJoinStyle = kCGLineJoinRound
        
        if animationDuration < 15.0{
            
            path.moveToPoint(CGPoint(x: size.width*0.0,y: size.height*0.1))
            path.addQuadCurveToPoint(
                CGPoint(x: size.width*0.8,y: size.height*0.3),
                controlPoint: CGPoint(x: size.width*0.5,y: size.height*0.0))
            path.addQuadCurveToPoint(
                CGPoint(x: size.width*0.5,y: size.height*0.9),
                controlPoint: CGPoint(x: size.width*1.2,y: size.height*0.7))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.2,y: size.height*0.5),
                controlPoint1: CGPoint(x: size.width*0.1,y: size.height*1.0),
                controlPoint2: CGPoint(x: -size.width*0.1,y: size.height*0.5))
            
            path.addLineToPoint(CGPoint(x: size.width*0.2,y: size.height*0.5))
            
        }
            
        else if animationDuration < 30.0{
            
            path.moveToPoint(CGPoint(x: size.width*0.0,y: size.height*0.1))
            path.addQuadCurveToPoint(
                CGPoint(x: size.width*0.9,y: size.height*0.65),
                controlPoint: CGPoint(x: size.width*0.9,y: size.height*0.0))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.1,y: size.height*0.35),
                controlPoint1: CGPoint(x: size.width*0.9,y: size.height*1.0),
                controlPoint2: CGPoint(x: size.width*0.0,y: size.height*1.1))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.81,y: size.height*0.6),
                controlPoint1: CGPoint(x: size.width*0.2,y: -size.height*0.2),
                controlPoint2: CGPoint(x: size.width*0.8,y: size.height*0.1))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.2,y: size.height*0.5),
                controlPoint1: CGPoint(x: size.width*0.8,y: size.height*1.2),
                controlPoint2: CGPoint(x: -size.width*0.2,y: size.height*0.5))
            
            path.addLineToPoint(CGPoint(x: size.width*0.2,y: size.height*0.5))
            
        }
            
        else if animationDuration > 30.0{
            
            path.moveToPoint(CGPoint(x: size.width*0.0,y: size.height*0.1))
            path.addQuadCurveToPoint(
                CGPoint(x: size.width*0.9,y: size.height*0.65),
                controlPoint: CGPoint(x: size.width*0.9,y: size.height*0.0))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.1,y: size.height*0.35),
                controlPoint1: CGPoint(x: size.width*0.9,y: size.height*1.0),
                controlPoint2: CGPoint(x: size.width*0.0,y: size.height*1.1))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.81,y: size.height*0.6),
                controlPoint1: CGPoint(x: size.width*0.2,y: -size.height*0.2),
                controlPoint2: CGPoint(x: size.width*0.8,y: size.height*0.1))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.1,y: size.height*0.45),
                controlPoint1: CGPoint(x: size.width*0.8,y: size.height*1.2),
                controlPoint2: CGPoint(x: -size.width*0.2,y: size.height*0.8))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.85,y: size.height*0.55),
                controlPoint1: CGPoint(x: size.width*0.5,y: size.height*0.0),
                controlPoint2: CGPoint(x: size.width*1.0,y: size.height*0.0))
            
            path.addCurveToPoint(CGPoint(x: size.width*0.2,y: size.height*0.5),
                controlPoint1: CGPoint(x: size.width*0.5,y: size.height*1.5),
                controlPoint2: CGPoint(x: -size.width*0.1,y: size.height*0.5))
            
            path.addLineToPoint(CGPoint(x: size.width*0.2,y: size.height*0.5))
            
            
        }
        
        
        
        
        
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.beginTime = AVCoreAnimationBeginTimeAtZero
        anim.duration = animationDuration
        
        //        if animationDuration > 5.0 {
        //            anim.duration = animationDuration-2.0
        //        }
        
        
        // we add the animation to the squares 'layer' property
        layer.addAnimation(anim, forKey: nil)
        
    }
}