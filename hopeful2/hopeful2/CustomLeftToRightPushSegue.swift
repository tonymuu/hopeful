//
//  CustomLeftToRightPushSegue.swift
//  hopeful2
//
//  Created by Tony Mu on 8/12/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class CustomLeftToRightPushSegue: UIStoryboardSegue {
    override func perform() {
//        super.perform()
        
        let sourceVC: UIViewController = self.sourceViewController as! UIViewController
        let destinationVC: UIViewController = self.destinationViewController as! UIViewController
        
        var transition = CATransition()
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        
        sourceVC.navigationController!.view.layer.addAnimation(transition, forKey: kCATransition)
        sourceVC.presentViewController(destinationVC, animated: true, completion: nil)
        
    }
}
