//
//  TechnicianReportTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/3/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class TechnicianReportTableViewController: UITableViewController, communicationControllerStatus, communicationControllerRootCause, UIPopoverPresentationControllerDelegate, UITextViewDelegate, UIPopoverControllerDelegate {
  
    @IBOutlet weak var vStatusLabel: UILabel!
    @IBOutlet weak var vRootCauseLabel: UILabel!

    @IBOutlet weak var vNoteTxtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vNoteTxtView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextView delegate
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = ""
    }
    
    // MARK: - back from protocal
    func backFromSelectedStatus(statusId: Int, statusId2 : Int) {
        let statusFilePath = NSBundle.mainBundle().pathForResource("WorkOrderStatus", ofType: "plist")
        let statusArray = NSArray(contentsOfFile: statusFilePath!)!
        if statusId < 3 {
            self.vStatusLabel.text = String(statusArray[statusId].objectForKey("status_name_en")!)

        }else{
            let subArray = statusArray[statusId].objectForKey("sub") as! NSArray
            self.vStatusLabel.text = String(subArray[statusId2].objectForKey("name_en")!)
        }
        vStatusLabel.textColor = UIColor.blackColor()
        
    }
    
    func backFromSelectedRootCause(rootCauseId: Int) {
        let rootCauseFilePath = NSBundle.mainBundle().pathForResource("RootCause", ofType: "plist")
        let rootCauseArray = NSArray(contentsOfFile: rootCauseFilePath!)!
        vRootCauseLabel.text = String(rootCauseArray[rootCauseId].objectForKey("rootcause_name")!)
        vRootCauseLabel.textColor = UIColor.blackColor()
    }


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "workOrderStatusSegue" {
            let navWorkOrderStatusVC = segue.destinationViewController as! UINavigationController
            let workOrderStatusVC = navWorkOrderStatusVC.topViewController as! WorkOrderStatus1TableViewController
            workOrderStatusVC.delegate = self
        }else if segue.identifier == "rootCauseSegue" {
            let navWorkOrderRootCauseVC = segue.destinationViewController as! UINavigationController
            let workOrderRootCauseVC = navWorkOrderRootCauseVC.topViewController as! RootCauseTableViewController
            workOrderRootCauseVC.delegate = self
        }else if segue.identifier == "photoSegue" {

        }
        
    }
    
    @IBAction func technicalSignOff(){
        let alertController = UIAlertController(title: "", message: "To complete the report, hand the iPad to your customer to Signoff", preferredStyle: UIAlertControllerStyle.Alert)
        let okButton =  UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                self.performSegueWithIdentifier("customerSignOffSegue", sender: nil)
            
            }
        )
        alertController.addAction(okButton)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }


}
