//
//  MainPageViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/11/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet weak var vTitleItem: UINavigationItem!
    @IBOutlet weak var vTechnicianNameBarBtn: UIBarButtonItem!
    
    var vTechnicianName = ""
    var vWorkUnit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let technicianIcon = UIImage(named: "icon_technician")
        let imageView = UIImageView(image: technicianIcon)
        let imageLeftBarButton = UIBarButtonItem(customView: imageView)
        self.navigationItem.leftBarButtonItem = imageLeftBarButton;
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "sectionChangeMethod:", name: "sectionChange", object: nil)
        
        self.vTechnicianNameBarBtn.title = self.vTechnicianName
        self.vTechnicianNameBarBtn.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()] , forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sectionChangeMethod(notif: NSNotification) {
        if let passedString: AnyObject = notif.userInfo?["title"] {
            self.vTitleItem.title = passedString as? String
            print("\(passedString)")
        }
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "sectionChange", object:nil)
    }
    
    @IBAction func signOut(){
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "splitViewSegue"{
            let splitViewMainPageVC = segue.destinationViewController as! UISplitViewController
            let navMasterVC  = splitViewMainPageVC.viewControllers.first as! UINavigationController
            let menuTableVC = navMasterVC.topViewController as! MenuTableViewController
            let navDetailVC = splitViewMainPageVC.viewControllers.last as! UINavigationController
            let detailVC = navDetailVC.topViewController as! DashboardViewController
            detailVC.vWorkUnit = self.vWorkUnit
            menuTableVC.vWorkUnit = self.vWorkUnit
        }
    }

}
