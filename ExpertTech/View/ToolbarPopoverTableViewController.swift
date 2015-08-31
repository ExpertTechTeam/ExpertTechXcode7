//
//  InstructionsPopoverTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class ToolbarPopoverTableViewController: UITableViewController {
 
    @IBOutlet weak var vNavigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vNavigationBar.barTintColor = Constants.Color.toolbar_bg
        self.vNavigationBar.tintColor = UIColor.blueColor()
        self.vNavigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blackColor()]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

}
