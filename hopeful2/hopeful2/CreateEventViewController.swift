import UIKit
import BSImagePicker
import Photos

class CreateEventViewController: UIViewController {
    let apiKey = "2e9a9f67125e8bcd48aa93a806495dba"
    let secret = "b80c63128f3ad229"
    
    @IBOutlet weak var hopeTextField: UITextField!
    
    @IBOutlet weak var startTimeTextField: UITextField!
    
    @IBOutlet weak var endTimeTextField: UITextField!
    
    var rootDict: NSMutableDictionary!
    var rootArray: NSMutableArray!
    
    var hope: NSMutableDictionary = NSMutableDictionary()
    var paths: Array<AnyObject> = []
    var documentsDirectory: String = ""
    var path: String = ""
    
    @IBAction func doneWasTapped(sender: AnyObject) {
        saveData()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func pickdate(sender: AnyObject) {
        
        let hsdpvc = HSDatePickerViewController()
        hsdpvc.mainColor = UIColor.blackColor()
        
        self.presentViewController(hsdpvc, animated: true, completion: nil)
    }
    
    @IBAction func pickImage(sender: AnyObject) {
        
        let fetchOptions = PHFetchOptions()
        
        let cameraRollCollection = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .SmartAlbumUserLibrary, options: fetchOptions).objectAtIndex(0) as! PHAssetCollection
        
        let assets = PHAsset.fetchAssetsInAssetCollection(cameraRollCollection, options: fetchOptions)
        let first = assets.objectAtIndex(0) as! PHAsset
        let second = assets.objectAtIndex(0) as! PHAsset
        let third = assets.objectAtIndex(0) as! PHAsset
        
        let selectedAssets = [first, second, third]
        
        
        let transientCollection = PHAssetCollection.transientAssetCollectionWithAssets(selectedAssets, title: "Custom Album")
        
        let ipvc: BSImagePickerViewController = BSImagePickerViewController(assetCollection: transientCollection, selections: selectedAssets)
        
        bs_presentImagePickerController(ipvc, animated: true,
            select: { (asset: PHAsset) -> Void in
                println("select")
            }, deselect: { (asset: PHAsset) -> Void in
                println("deselect")
            }, cancel: { (assets: [PHAsset]) -> Void in
                println("cancel")
            }, finish: { (assets: [PHAsset]) -> Void in
                println("finish")
            }, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let fileManager = NSFileManager.defaultManager()
        
        paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as Array
        documentsDirectory = paths[0] as! String
        path = documentsDirectory.stringByAppendingString("/hope.plist")
        
        if(!fileManager.fileExistsAtPath(path)) {
            println("file doesn't exist")
            if let bundlePath = NSBundle.mainBundle().pathForResource("hope", ofType: "plist") {
                println("\(bundlePath)")
                println("\(path)")
                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
            } else {
                println("not found, creating... ")
                
                let myDict: NSDictionary = ["Initialize" : "Initialize"]

                myDict.writeToFile(path, atomically: false)
                
                println("created")
                
                println(path)
            }
        } else {
            println("exists")
            println(path)

        }

        rootDict = NSMutableDictionary(contentsOfFile: path)
        
        
        if let array: AnyObject = rootDict.objectForKey("Hopes") {
            rootArray = array as! NSMutableArray
        } else {
            rootArray = NSMutableArray()
            rootDict.setValue(rootArray, forKey: "Hopes")
        }
}

    func saveData() {
        if(hopeTextField.text != nil) {
            let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as Array
            let documentsDirectory = paths[0] as! String
            let path = documentsDirectory.stringByAppendingString("/hope.plist")
            println("write to \(documentsDirectory)")
            
            hope.setValue(hopeTextField.text, forKey: "hopeTitle")
//            hope.setValue(startTimeTextField.text, forKey: "startTime")
//            hope.setValue(endTimeTextField.text, forKey: "endTime")
            
            rootArray.addObject(hope)
            
            rootDict.writeToFile(path, atomically: false)
        }
        
    }
    
//    func loadData() {
//        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as Array
//        let documentDirectory = paths[0] as! String
//        let path = documentDirectory.stringByAppendingString("user.plist")
//        let fileManager = NSFileManager.defaultManager()
//        
//        if(!fileManager.fileExistsAtPath(path)) {
//            if let bundlePath = NSBundle.mainBundle().pathForResource("user", ofType: "plist") {
//                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
//                println("copied file to location")
//                fileManager.copyItemAtPath(bundlePath, toPath: path, error: nil)
//            } else {
//                println("not found")
//            }
//        } else {
//            println("already exists")
//
//        }
//    
//        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
//        
//        if let dict = resultDictionary {
//            rootDict = dict
//        }
//        
//    }
}
