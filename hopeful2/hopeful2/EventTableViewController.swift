import UIKit


class EventTableViewController: UITableViewController, UIScrollViewDelegate, UITableViewDelegate {
    
    var isAtTop = true
    
    @IBAction func showMenu(sender: AnyObject) {
        self.performSegueWithIdentifier("ShowMenuSegue", sender: sender.barButtonItem)
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize initial dictionary - default dictionary with attractive pictures/contents
        
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clearColor()
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)

        
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView.contentOffset.y == 0) {
            println("top of scroll view")
            isAtTop = true
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! EventTableViewCell
        cell.frontViewContainer.frame.size = CGSize(width: cell.frame.size.width/2, height: cell.frontViewContainer.frame.size.height)
        cell.frontView.frame.size = CGSize(width: cell.frame.size.width/2, height: cell.frontViewContainer.frame.size.height)
        cell.eventPhotoView.frame.size = CGSize(width: cell.frame.size.width/2, height: cell.frontViewContainer.frame.size.height)
        
        
        cell.frontPhotoView.image = UIImage(named: "download.jpeg")
        cell.eventPhotoView.image = UIImage(named: "download2.jpg")
        
        cell.frontView.contentMode = UIViewContentMode.ScaleAspectFill
        cell.eventPhotoView.contentMode = UIViewContentMode.ScaleAspectFill
        cell.frontViewContainer.contentMode = UIViewContentMode.ScaleAspectFill
        
        cell.frontView.clipsToBounds = true
        cell.eventPhotoView.clipsToBounds = true
        cell.frontViewContainer.clipsToBounds = true
        
        cell.hopeLabel.text = cell.hopeLabel.text?.stringByAppendingString(": aaaaaa")
        cell.startTimeLabel.text = cell.startTimeLabel.text?.stringByAppendingString(": ")
        cell.endTimeLabel.text = cell.endTimeLabel.text?.stringByAppendingString(": ")
        
        
//        println("\(HopesLoader.loadHopes(ForIndexPath: indexPath))")
        
        
        showPhotoView(cell)
        
        UIView.animateWithDuration(6.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut | UIViewAnimationOptions.Autoreverse, animations: {
            cell.frontViewContainer.frame.size = CGSize(width: cell.eventPhotoView.frame.size.width, height: cell.frontViewContainer.frame.size.height)
            }, completion: nil)
        
        println("")
        
       return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) as? EventTableViewCell {
            let photoView = cell.eventPhotoView
            let frontViewContainer = cell.frontViewContainer
            
            if(!cell.didSelect) {
                UIView.transitionWithView(cell.contentView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                    self.showDetailView(cell)
                    }, completion: nil)
            } else {
                UIView.transitionWithView(cell.contentView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                    self.showPhotoView(cell)
                    }, completion: nil)
            }
        }
    }
    
    func showPhotoView(cell: EventTableViewCell) {
//        cell.eventPhotoView.hidden = false
//        cell.frontViewContainer.hidden = false
//        cell.frontView.hidden = false
//        cell.eventDetailView.hidden = true
        var frontSubviews = cell.frontView.subviews as! [UIView]
        var backSubviews = cell.backView.subviews as! [UIView]

        for myView: UIView in frontSubviews {
            myView.hidden = false
        }

        for myView: UIView in backSubviews {
            myView.hidden = true
        }
        
//        cell.frontView.hidden = false
//        cell.backView.hidden = true
//
        cell.didSelect = false

    }
    
    func showDetailView(cell: EventTableViewCell) {
//        cell.eventPhotoView.hidden = true
//        cell.frontViewContainer.hidden = true
//        cell.frontView.hidden = true
//        cell.eventDetailView.hidden = false

        var frontSubviews = cell.frontView.subviews as! [UIView]
        var backSubviews = cell.backView.subviews as! [UIView]
        
        for myView: UIView in frontSubviews {
            myView.hidden = true
        }
        
        for myView: UIView in backSubviews {
            myView.hidden = false
        }

//        
//        cell.frontView.hidden = true
//        cell.backView.hidden = false
//        
        cell.didSelect = true
    }
    
}
