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
        
//        self.saveData()
        
        self.loadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func saveData() {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as Array
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingString("user.plist")
        
        var dict: NSMutableDictionary = ["XInitializeItem": "DoNotEverChangeMe"]
        
        dict.setObject("fffffff", forKey: "Description")
        dict.setObject("asdfjsdkfljkl", forKey: "Description")
        dict.setObject("231", forKey: "Start Time")
        dict.setObject("12121212121", forKey: "Start Time")
        dict.setObject("321321321", forKey: "End Time")
        
        dict.writeToFile(path, atomically: false)
    }
    
    func loadData() {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as Array
        let documentDirectory = paths[0] as! String
        let path = documentDirectory.stringByAppendingString("user.plist")
        let fileManager = NSFileManager.defaultManager()
        
        if(!fileManager.fileExistsAtPath(path)) {
            if let bundlePath = NSBundle.mainBundle().pathForResource("user", ofType: "plist") {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                println("copied file to location")
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
            } else {
                println("not found")
            }
        } else {
            println("already exists")

        }
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
        println("loaded user.plist")
        
        if let dict = resultDictionary {
            
            
            let descriptionKey = "Description"
            let startTimeKey = "Start Time"
            let endTimeKey = "End Time"
            
            let descriptions: Array = dict.objectForKey(descriptionKey) as AnyObject! as! Array<String>
            
            for description in descriptions {
                println(description)
            }
            
            println("\(dict.objectForKey(startTimeKey))")
            println("\(dict.objectForKey(endTimeKey))")
        }
        
    }
    

}
