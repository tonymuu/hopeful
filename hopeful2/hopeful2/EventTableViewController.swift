import UIKit


class EventTableViewController: UITableViewController, UIScrollViewDelegate, UITableViewDelegate {

    @IBOutlet weak var pullDownLabel: UILabel!
    
    
    var isAtTop = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize initial dictionary - default dictionary with attractive pictures/contents

        self.refreshControl = UIRefreshControl()
        self.refreshControl?.attributedTitle = NSAttributedString(string: "pull down to create")
        self.refreshControl?.tintColor = UIColor.whiteColor()
        self.refreshControl?.backgroundColor = UIColor.blueColor()
        self.refreshControl?.addTarget(self, action: "createEvent", forControlEvents: UIControlEvents.ValueChanged)
        
        if(!isAtTop) {
            self.pullDownLabel.frame.size = CGSize(width: self.pullDownLabel.frame.size.width, height: 0)
        }
        
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        if(scrollView.contentOffset.y == 0) {
            println("top of scroll view")
            isAtTop = true
            UIView.animateWithDuration(0.6, animations: {
                self.pullDownLabel.frame.size = CGSize(width: self.pullDownLabel.frame.size.width, height: 32.0)
            })
        } else {
//            isAtTop = false
            UIView.animateWithDuration(0.6, animations: {
                self.pullDownLabel.frame.size = CGSize(width: self.pullDownLabel.frame.size.width, height: 0)
            })
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
        
        cell.eventDetailView.backgroundColor = UIColor.blueColor()
        
        if(indexPath.row <= 2) {
            cell.frontViewContainer.frame.size = CGSize(width: 0, height: cell.frontViewContainer.frame.size.height)
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
            
        } else {
            var viewCell = UIView(frame: cell.frame)
            viewCell.backgroundColor = UIColor.redColor()
            
            cell.backgroundColor = UIColor.grayColor()
            cell.selectedBackgroundView = viewCell
        }
        
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
    
    func createEvent() {
        if(isAtTop) {
            println("is at top and pull down")
            self.performSegueWithIdentifier("CreateEventSegue", sender: self)
            self.refreshControl?.endRefreshing()
        }
        
        
    }
}
