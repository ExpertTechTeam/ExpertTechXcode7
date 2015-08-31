//
//  WorkOrderStatus2TableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/10/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class WorkOrderStatus2TableViewController: UITableViewController {
    var selectedStatusId : Int!
     var delegate:communicationControllerStatus? = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.backFromSelectedStatus(selectedStatusId, statusId2: indexPath.row)
    }

 
}
