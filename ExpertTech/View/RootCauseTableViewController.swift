//
//  RootCauseTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/10/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

protocol communicationControllerRootCause {
    func backFromSelectedRootCause(rootCauseId:Int)
}

class RootCauseTableViewController: UITableViewController {
    var delegate:communicationControllerRootCause? = nil;
    
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
        dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.backFromSelectedRootCause(indexPath.row)
    }
}
