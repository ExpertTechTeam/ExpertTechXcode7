//
//  MenuTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//  

import UIKit

class MenuTableViewController: UITableViewController, UISplitViewControllerDelegate, communicationControllerVehicle {
    var isSelectedFromMap:Bool = false
    var isCompletedWork:Bool = false
    var isSelectedVehicle:Bool = false
    var indexNumber:Int = 0
    var vWorkUnit:String = ""
    var openWorkOrderList = [WorkOrder]()
    var completedWorkOrderList = [WorkOrder]()
    var curWorkOrder:WorkOrder = WorkOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "selectedFromMapPinMethod:", name: "selectedFromMapPin", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "completedWorkOrderMethod:", name: "completedWorkOrder", object: nil)
        tableView.registerNib(UINib(nibName: "OverViewTableViewCell", bundle: nil), forCellReuseIdentifier: "overViewCell")
        tableView.registerNib(UINib(nibName: "OpenWorkOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "openWorkOrderCell")
        tableView.registerNib(UINib(nibName: "CompletedWorkOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "completedWorkOrderCell")
        GetWorkOrderByWorkUnitController().get(vWorkUnit, uiView: self)
    }
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Notification
    
    func selectedFromMapPinMethod(notif: NSNotification) {
        print("selected from map pin")
        self.isSelectedFromMap = true
        self.isCompletedWork = false
        if let passedInt: AnyObject = notif.userInfo?["indexNumber"] {
            self.indexNumber = passedInt as! Int - 1
        }
        print("index number : \(indexNumber)")

        self.tableView.reloadData()

    }
    func completedWorkOrderMethod(notif: NSNotification) {
        print("completed work order method")
        self.isCompletedWork = true
        self.isSelectedFromMap = false
        if let passedInt: AnyObject = notif.userInfo?["indexNumber"] {
            self.indexNumber = passedInt as! Int
        }
        var duration = ""
        if let passedString : AnyObject = notif.userInfo?["duration"]{
            duration = (passedString as! String).stringByReplacingOccurrencesOfString(":", withString: ".")
        }
        print("DURATION : \(duration)")
        
        let animations1: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .Automatic
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
            
        }
        UIView.animateWithDuration(0.7, delay: 2, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations1) { (Bool) -> Void in
        }
        /*
        self.tableView.beginUpdates()
        self.tableView.reloadSections(NSIndexSet(index: 1), withRowAnimation: UITableViewRowAnimation.Top)
        self.tableView.reloadSections(NSIndexSet(index: 2), withRowAnimation: UITableViewRowAnimation.Top)
        
        self.tableView.endUpdates()*/
        
        let completedWorkOrder = self.openWorkOrderList[self.indexNumber]
        self.openWorkOrderList.removeAtIndex(self.indexNumber)
        completedWorkOrder.woo_status_en = "complete"
        completedWorkOrder.woo_duration = NSDecimalNumber(string: duration)
        print("WOO_DURATION \(completedWorkOrder.woo_duration)")
        self.completedWorkOrderList.append(completedWorkOrder)
        self.tableView.reloadData()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "selectedFromMapPin", object:nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "completedWorkOrder", object:nil)
    }
    
    // MARK: - Communicate
    func backFromVehicle() {
        self.isSelectedVehicle = true
        self.tableView.reloadData()
    }

    // MARK: - Table view data source and delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            return 2
        }else if section == 1 {
            return self.openWorkOrderList.count
        }else {
             return self.completedWorkOrderList.count > 0 ? self.completedWorkOrderList.count : 1
        }
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        }else{
            return 50
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0  {
            if indexPath.row == 0 {
                tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                performSegueWithIdentifier("overViewSegue", sender: nil)
                let dict: [String : AnyObject] = ["title" : "Daily Overview" as String]
                NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
            }
            
        }else if indexPath.section == 1 {
            if isSelectedFromMap  {
                if indexPath.row == indexNumber {
                    print("section == 1")
                    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                    self.curWorkOrder = self.openWorkOrderList[indexPath.row]
                    performSegueWithIdentifier("workOrderSegue", sender: nil)
                    let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
                    NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
                }
            }
            if isCompletedWork {
                if indexPath.row == 0 {
                    tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.Top)
                    self.curWorkOrder = self.openWorkOrderList[indexPath.row]
                    performSegueWithIdentifier("workOrderSegue", sender: nil)
                    let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
                    NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        isSelectedFromMap = false
        let selectedCell = tableView.cellForRowAtIndexPath(indexPath)
        selectedCell!.setSelected(true, animated: false)
        if indexPath.section == 0 {
            if indexPath.row == 0  {
                performSegueWithIdentifier("overViewSegue", sender: nil)
                let dict: [String : AnyObject] = ["title" : "Daily Overview" as String]
                NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
            }else{
                performSegueWithIdentifier("vehicleSegue", sender: nil)
                let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
                NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
            }
        }else if indexPath.section == 1{
            self.indexNumber = indexPath.row
            self.curWorkOrder = self.openWorkOrderList[indexPath.row]
            performSegueWithIdentifier("workOrderSegue", sender: false)
            
            let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }else if indexPath.section == 2{
            self.indexNumber = indexPath.row
            print("INDEX PATH SELECTED : 2")
            self.curWorkOrder = self.completedWorkOrderList[indexPath.row]
            performSegueWithIdentifier("workOrderSegue", sender: true)
            let dict: [String : AnyObject] = ["title" : "Expert Tech" as String]
            NSNotificationCenter.defaultCenter().postNotificationName("sectionChange", object: nil, userInfo: dict)
        }
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let cellToDeSelect = tableView.cellForRowAtIndexPath(indexPath)
        cellToDeSelect!.setSelected(false, animated: false)
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0 {
            return "OVERVIEW"
        }else if section == 1{
            return "OPEN WORK ORDERS"
        }else{
            return "COMPLETED WORK ORDERS"
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("overViewCell", forIndexPath: indexPath) as! OverViewTableViewCell
            if indexPath.row == 0 {
                cell.vImageTitle.image = UIImage(named: "menu_dashboard.png")
                cell.vTitle.text = "Dashboard"
                cell.vStatus.text = ""
                
            }else{
                cell.vImageTitle.image = UIImage(named: "menu_vehicle.png")
                cell.vTitle.text = "Vehicle"
                if isSelectedVehicle {
                    cell.vStatus.text = "Selected"
                }else{
                    cell.vStatus.text = "Select to Vehicle"
                }
                cell.isSelectedVehicle = isSelectedVehicle
            }
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCellWithIdentifier("openWorkOrderCell", forIndexPath: indexPath) as! OpenWorkOrderTableViewCell
            
            let workOrder = openWorkOrderList[indexPath.row]
            let producttype1 = workOrder.woo_product_type1
            let producttype2 = workOrder.woo_product_type2
            cell.vOrderType1.text = "\(producttype1) \(producttype2)"
            cell.vOrderType2.text = workOrder.woo_order_no
            
            let date:String = workOrder.woo_working_date
            let dateFormatterToDate = NSDateFormatter()
            dateFormatterToDate.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let dateWithFormat = dateFormatterToDate.dateFromString(date)
            print("DATE \(dateWithFormat!)")
            let dateFormatterToString = NSDateFormatter();
            dateFormatterToString.timeZone = NSTimeZone(abbreviation: "UTC")
            dateFormatterToString.dateFormat = "HH:mm a";
            let strDateWithFormat = dateFormatterToString.stringFromDate(dateWithFormat!);
            cell.vTime.text = strDateWithFormat
            
            cell.vSequence.text = String(indexPath.row + 1)
            return cell
        } else {
            if completedWorkOrderList.count > 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("completedWorkOrderCell", forIndexPath: indexPath) as! CompletedWorkOrderTableViewCell
                let workOrder = completedWorkOrderList[indexPath.row]
                let producttype1 = (workOrder.woo_product_type1 as String)
                let producttype2 = (workOrder.woo_product_type2 as String)
                cell.vOrderType1.text = "\(producttype1) \(producttype2)"
                cell.vOrderType2.text = workOrder.woo_order_no as String
                let durationStr = String(format:"%.2f", workOrder.woo_duration.floatValue)
                let durationArr = durationStr.componentsSeparatedByString(".")
                let durationMin: String = String(format: "%02d", Int(durationArr[0])!)
                let durationSec: String = durationArr[1]
                cell.vTime.text = "\(durationMin):\(durationSec)"
                
                return cell
            }else{
                let cell = UITableViewCell()
                cell.textLabel!.text = "You have no completed work orders"
                cell.textLabel!.textColor = UIColor.grayColor()
                cell.textLabel!.font = UIFont.italicSystemFontOfSize(13.0)
                cell.userInteractionEnabled = false
                return cell
            }

        }

    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "workOrderSegue"{
            print("Open work order segue")
            let controller:DetailWorkOrderViewController = segue.destinationViewController as! DetailWorkOrderViewController
            controller.workOrderId = self.curWorkOrder.woo_id
            controller.indexNumber = self.indexNumber
            controller.isSelectedVehicle = self.isSelectedVehicle
            controller.isCompletedWorkOrder = self.curWorkOrder.woo_status_en.lowercaseString == "open" ? false : true
            controller.workOrderDuration = self.curWorkOrder.woo_duration
            
        }else if segue.identifier == "overViewSegue"{
            print("Over view segue")
            let controller:DashboardViewController = segue.destinationViewController as! DashboardViewController
            controller.vWorkUnit = self.vWorkUnit
            controller.openWorkOrderList = self.openWorkOrderList
            
        }else{
            print("Vehicle segue")
             let controller:VehicleTableViewController = segue.destinationViewController as! VehicleTableViewController
            controller.isSelectedVehicle = isSelectedVehicle
            controller.delegate = self
        }
    }
    
    func updateView(response: NSArray){
        let workOrderListResult = response
        print("Found the result from MenuTableViewController : \(response.count) item")
        if workOrderListResult.count > 0 {
            for item in workOrderListResult {
                let workOrder = WorkOrder(dict: item as! NSDictionary)
                if workOrder.woo_status_en.lowercaseString == "open" {
                    self.openWorkOrderList.append(workOrder)
                }else{
                    self.completedWorkOrderList.append(workOrder)
                }
            }
            self.tableView.reloadData()
        }else{
           
        }
        
        
    }
    


}
