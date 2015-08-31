//
//  WorkOrderStatus1TableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/10/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

protocol communicationControllerStatus {
    func backFromSelectedStatus(statusId:Int, statusId2 : Int)
}

class WorkOrderStatus1TableViewController: UITableViewController{
    var delegate:communicationControllerStatus? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.tintColor = UIColor.blueColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("index row : \(indexPath.row)")
        if indexPath.row < 3 {
            dismissViewControllerAnimated(true, completion: nil)
            self.delegate?.backFromSelectedStatus(indexPath.row, statusId2: 0)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let workOrderStatus2 = segue.destinationViewController as! WorkOrderStatus2TableViewController
        let row = self.tableView.indexPathForSelectedRow!.row
        workOrderStatus2.selectedStatusId = row
        workOrderStatus2.delegate = self.delegate
    }

}
