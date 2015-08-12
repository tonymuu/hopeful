//
//  MenuViewController.swift
//  hopeful2
//
//  Created by Tony Mu on 8/12/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBAction func doneWasTapped(sender: AnyObject) {
//        self.presentViewController(EventTableViewController(), animated: true, completion: nil)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
