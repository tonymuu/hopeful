//
//  EventTableViewCell.swift
//  hopeful2
//
//  Created by Mu Tong on 8/8/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventPhotoView: UIImageView!
    @IBOutlet weak var eventDetailView: UIView!
    @IBOutlet weak var frontViewContainer: UIView!
    @IBOutlet weak var frontView: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        
//        eventPhotoView = UIImageView(frame: self.bounds)
//        frontViewContainer = UIView(frame: eventPhotoView.bounds)
//        frontView = UIImageView(frame: frontViewContainer.bounds)
//        
//        frontViewContainer.frame.size = CGSize(width: 0, height: frontViewContainer.frame.size.height)
//        
//        self.addSubview(eventPhotoView)
//        eventPhotoView.addSubview(frontViewContainer)
//        frontViewContainer.addSubview(frontView)
//        
//        frontView.image = UIImage(named: "download.jpeg")
//        eventPhotoView.image = UIImage(named: "download2.jpg")
//        
//        frontView.contentMode = UIViewContentMode.ScaleAspectFill
//        eventPhotoView.contentMode = UIViewContentMode.ScaleAspectFill
//        
//        frontView.clipsToBounds = true
//        eventPhotoView.clipsToBounds = true
//        frontViewContainer.clipsToBounds = true
//        
//        UIView.animateWithDuration(6.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut | UIViewAnimationOptions.Autoreverse, animations: {
//            self.frontViewContainer.frame.size = CGSize(width: self.eventPhotoView.frame.size.width, height: self.frontViewContainer.frame.size.height)
//            }, completion: nil)
//        
//
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }

}
