//
//  WorkOrder.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 7/28/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation

public class WorkOrder {
    
    var woo_id          : Int = 0
    var woo_workunit    : String = ""
    var woo_sequence    : Int = 0
    var woo_wos         : WorkOrderStatus = WorkOrderStatus()
    var woo_product_type : String = ""
    var woo_order_no    : String = ""
    var woo_cus_name    : String = ""
    var woo_cus_address : String = ""
    var woo_cus_serv_id : String = ""
    var woo_gis         : String = ""
    var woo_longitude   : String = ""
    var woo_latitude    : String = ""
    var woo_report_date : NSDate = NSDate()
    var woo_test_result : String = ""
    var woo_fault_desc  : String = ""
    var woo_note        : String = ""
    var woo_reported_by : String = ""
    var woo_contact     : String = ""
    var woo_dispatcher  : String = ""
    var woo_tie         : String = ""
    var woo_pri         : String = ""
    var woo_cab         : String = ""
    var woo_sec         : String = ""
    var woo_dp          : String = ""
    var woo_pin         : String = ""
    var woo_dw          : String = ""
    var woo_adsl_info   : String = ""
    var woo_adsl_system : String = ""
    var woo_adsl_network : String = ""
    var woo_adsl_speed   : String = ""
    var woo_router_brand : String = ""
    var woo_port        : String = ""
    var woo_modem_brand : String = ""
    var woo_slotln      : String = ""
    var woo_portln      : String = ""
    var woo_exchange    : String = ""
    var woo_duration    : NSDecimalNumber = 0
    
    init (woo_id:Int,woo_lat:String,woo_lng:String){
        self.woo_id = woo_id
        self.woo_latitude = woo_lat
        self.woo_longitude = woo_lng
    }
    
    
    
}
