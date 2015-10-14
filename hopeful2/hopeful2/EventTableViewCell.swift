//
//  EventTableViewCell.swift
//  hopeful2
//
//  Created by Mu Tong on 8/8/15.
//  Copyright (c) 2015 Tony Mu. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var frontView: UIView!
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var eventPhotoView: UIImageView!
    @IBOutlet weak var eventDetailView: UIView!
    @IBOutlet weak var frontViewContainer: UIView!
    @IBOutlet weak var frontPhotoView: UIImageView!
    
    @IBOutlet weak var hopeLabel: UILabel!
    
    @IBOutlet weak var startTimeLabel: UILabel!

    @IBOutlet weak var endTimeLabel: UILabel!
    
    var didSelect = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }


}
