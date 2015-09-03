//
//  PopOverDetailMapTableViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/14/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class PopOverDetailMapTableViewController: UITableViewController {

    @IBOutlet weak var vCustomerDetailTxtView: UITextView!
    @IBOutlet weak var vWorkOderNoBarBtn: UIBarButtonItem!
    @IBOutlet weak var vNavigationBar: UINavigationBar!
    var indexNumber:Int = 0
    var workOrderId:NSDecimalNumber = 0
    
    override func viewDidLoad() {
        print("Popover")
        super.viewDidLoad()
        self.vNavigationBar.barTintColor = Constants.Color.toolbar_bg
        self.vWorkOderNoBarBtn.setTitleTextAttributes([NSForegroundColorAttributeName: Constants.Color.midnightblue] , forState: UIControlState.Normal)
        GetWorkOrderDetailByWorkUnitController().getFromSelectMap(workOrderId, uiView: self)
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    @IBAction func onSelectedDetail(sender: AnyObject) {
        print("on select detail")
    }
    */
    
    
    
    @IBAction func onSelectWorkOrder(sender: AnyObject) {
        print("on select work order \(indexNumber), work order id \(workOrderId)")
        let dict: [String : AnyObject] = ["indexNumber" : indexNumber]
        NSNotificationCenter.defaultCenter().postNotificationName("selectedFromMapPin", object: nil, userInfo: dict)
        self.dismissViewControllerAnimated(false, completion: nil)

    }
    
    func updateView(response: NSArray){
        let workOrderDetailList = response
        print("Found the result from PopOverDetailMapTableViewController : \(response.count) item")
        if workOrderDetailList.count > 0 {
            let curWorkOrderDict = workOrderDetailList[0] as! NSDictionary
            let curWorkOrder:WorkOrder = WorkOrder(dict: curWorkOrderDict)
            let custname = curWorkOrder.woo_cus_name
            let custaddress = curWorkOrder.woo_cus_address
            let custservid = curWorkOrder.woo_cus_serv_id
            let custphoneno = curWorkOrder.woo_order_no
            self.vWorkOderNoBarBtn.title = "Work Order #\(custphoneno)"
            self.vCustomerDetailTxtView.text = "\(custname)\r\n\(custaddress)\r\n\(custservid)\r\n\(custphoneno)"
        }else{
            
        }
        
        
    }


}
