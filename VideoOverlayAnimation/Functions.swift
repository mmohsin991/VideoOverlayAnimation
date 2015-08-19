//
//  Functions.swift
//  VideoOverlayAnimation
//
//  Created by Mohsin on 19/08/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import UIKit


func imageWithColor(color : UIColor, imageSize :  CGSize) -> UIImage{
    
    UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
    color.setFill()
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height))   // Fill it with your color
    var image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image;
}
