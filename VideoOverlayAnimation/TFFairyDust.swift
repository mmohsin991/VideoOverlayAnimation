//
//  TFFairyDust.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 20/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit
import AVFoundation

class TFFairyDust {
    
    class func fairyDust(emittingPoint : CGPoint) -> CAEmitterLayer{
        
        
        var emit = CAEmitterLayer()
        emit.frame.origin = emittingPoint
        emit.emitterPosition = CGPoint(x: 0, y: 0)
        emit.emitterShape = kCAEmitterLayerPoint
        emit.emitterMode = kCAEmitterLayerPoints
        
        emit.lifetime = 2.0
        
        let cell = makeEmitterCellSmall()
        let cellGlow = makeEmitterCellGlow()
        
        emit.emitterCells = [cell,cellGlow]
        
        return emit
        
    }
    
    
    
    
    
    private class func makeEmitterCellSmall() -> CAEmitterCell{
        
        // make a partical image
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(3,3), false, 1)
        let con = UIGraphicsGetCurrentContext()
        CGContextAddEllipseInRect(con, CGRectMake(0,0,3,3))
        CGContextSetFillColorWithColor(con, kTFGoldenColor.CGColor)
        CGContextFillPath(con)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        // make a cell with that image
        let cell = CAEmitterCell()
        cell.contents = image.CGImage
        
        cell.birthRate = 40
        cell.lifetime = 1.0
        cell.velocity = -120
        cell.emissionRange = CGFloat(M_PI)/6.0
        
        cell.xAcceleration = -20
        cell.yAcceleration = -30
        
        
        cell.lifetimeRange = 0.4
        cell.velocityRange = 40
        //        cell.scaleRange = 0.2
        //        cell.scaleSpeed = 0.2
        //        cell.greenRange = 0.5
        //        cell.greenSpeed = 0.75
        
        
        
        
        //        // cell 2 for sprinkel
        //
        //        let cell2 = CAEmitterCell()
        //        cell.emitterCells = [cell2]
        //        cell2.contents = im.CGImage
        //        cell2.emissionRange = CGFloat(M_PI)
        //        cell2.birthRate = 200
        //        cell2.lifetime = 0.4
        //        cell2.velocity = 200
        //        cell2.scale = 0.2
        //        cell2.beginTime = 1.5
        //        cell2.duration = 0.3
        
        
        
        
        
        return cell
    }
    
    private class func makeEmitterCellGlow() -> CAEmitterCell{
        
        let image = UIImage(named: "glow.png")
        
        // make a cell with that image
        let cell = CAEmitterCell()
        cell.contents = image!.CGImage
        
        cell.birthRate = 10
        cell.lifetime = 1.0
        cell.velocity = -120
        cell.emissionRange = CGFloat(M_PI)/6.0
        
        cell.scale = 0.3
        cell.scaleRange = 1.0
        cell.scaleSpeed = 0.3
        
        cell.spin = 0.7
        
        cell.xAcceleration = -20
        cell.yAcceleration = -30
        
        cell.lifetimeRange = 0.4
        cell.velocityRange = 40
        //        cell.scaleRange = 0.2
        //        cell.scaleSpeed = 0.2
        //        cell.greenRange = 0.5
        
        return cell
    }
    

    
}



