//
//  EventTableViewController.swift
//  hopeful2
//
//  Created by Tony Mu on 8/5/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! UITableViewCell
//        cell.backgroundView = UIImageView(image: UIImage(named: "download.jpeg"))
        cell.backgroundView = UIImageView(image: UIImage(named: "download2.jpeg"), highlightedImage: UIImage(named: "download.jpeg"))
        
        return cell
    }

}
