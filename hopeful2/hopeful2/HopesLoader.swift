import Foundation

class HopesLoader: NSObject {
    func loadHopes(ForIndexPath indexPath: NSIndexPath) -> NSDictionary {
        let fileManager: NSFileManager = NSFileManager()
        
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.UserDirectory, NSSearchPathDomainMask.UserDomainMask, true) as Array
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingString("/hope.plist")
        
        if(!fileManager.fileExistsAtPath(path)) {
            if let bundlePath = NSBundle.mainBundle().pathForResource("hope", ofType: "plist") {
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
            } else {
                let dict: NSDictionary = ["Init" : "Init"]
                
                dict.writeToFile(path, atomically: false)
            }
        }
        
        let dict: NSDictionary
    }
}