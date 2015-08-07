//
//  CreateEventViewController.swift
//  hopeful2
//
//  Created by Tony Mu on 8/7/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {
    @IBAction func doneWasTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
