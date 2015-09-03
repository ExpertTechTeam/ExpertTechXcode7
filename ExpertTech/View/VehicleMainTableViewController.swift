//
//  VehicleMainTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 9/3/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class VehicleMainTableViewController: UITableViewController {
    var isSelectedVehicle:Bool = false
    
    @IBOutlet weak var vBarBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if isSelectedVehicle {
            self.vBarBtn.title = "Done"
        }else {
            self.vBarBtn.title = "Cancel"
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func barBtnClick(sender: AnyObject) {
        //let btn : UIBarButtonItem = sender as! UIBarButtonItem
        
        self.dismissViewControllerAnimated(true, completion: nil)
       
    }

        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
