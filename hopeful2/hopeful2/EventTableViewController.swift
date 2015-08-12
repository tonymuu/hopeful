import UIKit


class EventTableViewController: UITableViewController, UIScrollViewDelegate, UITableViewDelegate {
    
    var isAtTop = true
    
    @IBAction func createEvent() {
        if(isAtTop) {
            println("is at top and pull down")
            self.performSegueWithIdentifier("CreateEventSegue", sender: self)
            self.refreshControl?.endRefreshing()
        }        
    }
    
    @IBAction func showMenu(sender: AnyObject) {
        self.performSegueWithIdentifier("ShowMenuSegue", sender: sender.barButtonItem)
        
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize initial dictionary - default dictionary with attractive pictures/contents

        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "pull down to create")
        self.refreshControl?.tintColor = UIColor.whiteColor()
        self.refreshControl?.addTarget(self, action: "createEvent", forControlEvents: UIControlEvents.ValueChanged)
        
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


            cell.frontView.image = UIImage(named: "download.jpeg")
            cell.eventPhotoView.image = UIImage(named: "download2.jpg")
            
            cell.frontView.contentMode = UIViewContentMode.ScaleAspectFill
            cell.eventPhotoView.contentMode = UIViewContentMode.ScaleAspectFill
            cell.frontViewContainer.contentMode = UIViewContentMode.ScaleAspectFill
            
            cell.frontView.clipsToBounds = true
            cell.eventPhotoView.clipsToBounds = true
            cell.frontViewContainer.clipsToBounds = true
            
            showPhotoView(cell)
        
//            UIView.animateWithDuration(6.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut | UIViewAnimationOptions.Autoreverse, animations: {
//                cell.frontViewContainer.frame.size = CGSize(width: cell.eventPhotoView.frame.size.width, height: cell.frontViewContainer.frame.size.height)
//                }, completion: nil)
            
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
                cell.didSelect = true
            } else {
                UIView.transitionWithView(cell.contentView, duration: 1.0, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
                    self.showPhotoView(cell)
                    }, completion: nil)
                cell.didSelect = false
            }
        }
    }
    
    func showPhotoView(cell: EventTableViewCell) {
        cell.eventPhotoView.hidden = false
        cell.frontViewContainer.hidden = false
        cell.frontView.hidden = false
        cell.eventDetailView.hidden = true

    }
    
    func showDetailView(cell: EventTableViewCell) {
        cell.eventPhotoView.hidden = true
        cell.frontViewContainer.hidden = true
        cell.frontView.hidden = true
        cell.eventDetailView.hidden = false

    }
    
}
