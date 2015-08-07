import UIKit


class EventTableViewController: UITableViewController, UIScrollViewDelegate, UITableViewDelegate {

    @IBOutlet weak var pullDownLabel: UILabel!

    var isAtTop = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EventCell", forIndexPath: indexPath) as! UITableViewCell
    
        if(indexPath.row <= 2) {
            let backView = UIImageView(frame: cell.bounds)
            let frontViewContainer = UIView(frame: backView.bounds)
            let frontView = UIImageView(frame: frontViewContainer.bounds)
            
            frontViewContainer.frame.size = CGSize(width: 0, height: frontViewContainer.frame.size.height)
            
            cell.addSubview(backView)
            backView.addSubview(frontViewContainer)
             frontViewContainer.addSubview(frontView)
            
            frontView.image = UIImage(named: "download.jpeg")
            backView.image = UIImage(named: "download2.jpg")
            
            frontView.contentMode = UIViewContentMode.ScaleAspectFill
            backView.contentMode = UIViewContentMode.ScaleAspectFill
            
            frontView.clipsToBounds = true
            backView.clipsToBounds = true
            frontViewContainer.clipsToBounds = true
            
            UIView.animateWithDuration(6.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: {
                frontViewContainer.frame.size = CGSize(width: backView.frame.size.width, height: frontViewContainer.frame.size.height)
                }, completion: nil)
            
        } else {
            var viewCell = UIView(frame: cell.frame)
            viewCell.backgroundColor = UIColor.redColor()
            
            cell.backgroundColor = UIColor.grayColor()
            cell.selectedBackgroundView = viewCell
        }
        
        return cell
    }
    
    func createEvent() {
        if(isAtTop) {
            println("is at top and pull down")
            self.performSegueWithIdentifier("CreateEventSegue", sender: self)
            self.refreshControl?.endRefreshing()
        }
        
        
    }
}
