//
//  FairyAnimationVC.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 20/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit
import QuartzCore
import MobileCoreServices
import MediaPlayer
import AVFoundation

var kGolgenColor = UIColor(red: 1.0, green: 0.81, blue: 0.41, alpha: 1.0)
var kTFGoldenColor = UIColor(red: 0.98, green: 1.0, blue: 0.90, alpha: 1.0)


class FairyAnimationVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
        

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        
//        Fairy.fairy(TFFairySize.Small, fairyColor: TFFairyColors.Pink, center: CGPoint(x: 200, y: 300), fairyDustOn: true, useInAVFoundation: false, animationDuration: 14.0,  parentLayer: self.view.layer)

        Fairy.glowFairy(TFFairySize.Medium, fairyColor: TFFairyColors.Pink, center: CGPoint(x: 200, y: 300), fairyDustOn: true, useInAVFoundation: false, animationDuration: 44.0,  parentLayer: self.view.layer)


        
        
      //  self.imgView.image = Fairy.applyBorder(UIImage(named: "fairyLeg1Yellow.png")!)
        
    
        
        
//        self.imgView.image = TBImageResizing(UIImage(named: "glow.png")!, CGSize(width: 200, height: 200))
        
//       self.view.layer.addSublayer(TFFairyDust.fairyDust(CGPoint(x: 100, y: 100) ) )
        

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}


func TBImageResizing(image: UIImage, size: CGSize) -> UIImage{
    
    let hasAlpha = false
    let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
    
    
    let aspectRect = AVMakeRectWithAspectRatioInsideRect(image.size, CGRect(origin: CGPointZero, size: size))
    
    println("orignal Image size: \(image.size)")
    println("given size: \(size)")
    println("aspect Size: \(aspectRect.size)")
    
    UIGraphicsBeginImageContextWithOptions(aspectRect.size, hasAlpha, scale)
    image.drawInRect(CGRect(origin: CGPointZero, size: aspectRect.size))

    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    println("scaled Image Size: \(scaledImage.size)")
    
    return scaledImage
}


class MyView: UIView {
        
        override func drawRect(rect: CGRect) {
        
            //     var size = CGSize(width: 720, height: 1280)
            var size = CGSize(width: 320, height: 550)
            
            
            let path = UIBezierPath()
            path.lineJoinStyle = kCGLineJoinRound
            
            
            
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
            
            path.addCurveToPoint(CGPoint(x: size.width*0.5,y: size.height*0.5),
                controlPoint1: CGPoint(x: size.width*0.5,y: size.height*1.5),
                controlPoint2: CGPoint(x: -size.width*0.1,y: size.height*0.5))
            
            
            UIColor.greenColor().set()
            path.stroke()
        
            
            
            let endPath = UIBezierPath()
            endPath.lineJoinStyle = kCGLineJoinRound
            
            endPath.moveToPoint(CGPoint(x: size.width*0.5,y: size.height*0.5))
            endPath.addLineToPoint(CGPoint(x: size.width*1.5,y: size.height*0.5))
            
            UIColor.redColor().set()
            endPath.stroke()
    }
}

