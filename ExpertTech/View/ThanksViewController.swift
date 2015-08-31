//
//  ThanksViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/23/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class ThanksViewController: UIViewController {
    var isHiddenBackBtn:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        self.navigationItem.setHidesBackButton(isHiddenBackBtn, animated: false)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCloseClick(sender: AnyObject) {
        print("close click")
        self.dismissViewControllerAnimated(false, completion: nil)
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
