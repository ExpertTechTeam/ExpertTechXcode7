//
//  VehicleTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class VehicleTableViewController: UITableViewController {
    var delegate: communicationControllerVehicle? = nil
    var isSelectedVehicle:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let splitViewMainPageVC :UISplitViewController = segue.destinationViewController as! UISplitViewController
        let navMasterVC = splitViewMainPageVC.viewControllers.first as! UINavigationController
        let masterVC = navMasterVC.topViewController as! VehicleMainTableViewController
        masterVC.isSelectedVehicle = isSelectedVehicle
        let navDetailVC = splitViewMainPageVC.viewControllers.last as! UINavigationController
        let detailVC = navDetailVC.topViewController as! VehicleDetailViewController
        detailVC.delegate = delegate
    }
    

}
