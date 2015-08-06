//
//  BackView.swift
//  hopeful2
//
//  Created by Tony Mu on 8/6/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class BackView: UIImageView {
    override func drawRect(rect: CGRect) {
        var context: CGContextRef = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        CGContextSetShadowWithColor(context, CGSizeZero, 10, UIColor.whiteColor().CGColor)
        
        super.drawRect(rect)
        
        CGContextRestoreGState(context)
    }
}
