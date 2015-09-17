//
//  TFAnimation.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 17/09/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit
import AVFoundation


class TFAnimation {
    
    class func applyAnimation(layer : CALayer, animationDuration: Double, size: CGSize){
        
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
    
    
    
    private class func getPathType2(size: CGSize) -> CGPathRef{
        
        
        let path = UIBezierPath()
        path.lineJoinStyle = kCGLineJoinRound
        
        path.moveToPoint(CGPoint(x: -size.width*0.2,y: size.height*0.5))
        
        path.addCurveToPoint(CGPoint(x: size.width*0.85,y: size.height*0.25),
            controlPoint1: CGPoint(x: size.width*0.2,y: size.height*0.5),
            controlPoint2: CGPoint(x: size.width*0.9,y: size.height*0.5))
        
        path.addCurveToPoint(CGPoint(x: size.width*0.15,y: size.height*0.25),
            controlPoint1: CGPoint(x: size.width*0.8,y: size.height*0.0),
            controlPoint2: CGPoint(x: size.width*0.2,y: size.height*0.0))
        
        path.addCurveToPoint(CGPoint(x: size.width*0.85,y: size.height*0.5),
            controlPoint1: CGPoint(x: size.width*0.1,y: size.height*0.5),
            controlPoint2: CGPoint(x: size.width*0.9,y: size.height*0.5))
        
        return path.CGPath

    }
    
}