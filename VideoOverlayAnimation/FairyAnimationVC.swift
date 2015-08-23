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


var kGolgenColor = UIColor(red: 1.0, green: 0.81, blue: 0.41, alpha: 1.0)
var kTFGoldenColor = UIColor(red: 0.98, green: 1.0, blue: 0.90, alpha: 1.0)


class FairyAnimationVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let fairy = Fairy.fairy(CGSize(width: 100, height: 100), center: CGPoint(x: 200, y: 300), fairyDustOn: true)
    
        self.view.layer.addSublayer(fairy)
        
//       self.view.layer.addSublayer(TFFairyDust.fairyDust(CGPoint(x: 100, y: 100) ) )
        

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}



class MyView: UIView {
        
        override func drawRect(rect: CGRect) {
        
            let path = UIBezierPath()
            path.moveToPoint(CGPoint(x: 16,y: 16))
            path.addCurveToPoint(CGPoint(x: 300, y: 200), controlPoint1: CGPoint(x: 16, y: 400), controlPoint2: CGPoint(x: 300, y: 500))
            
            UIColor.greenColor().set()
            path.stroke()
        
            }
}