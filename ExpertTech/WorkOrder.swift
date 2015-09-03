//
//  WorkOrder.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 7/28/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation

public class WorkOrder {
    
    var woo_id          : NSDecimalNumber = 0
    var woo_workunit    : String = ""
    var woo_sequence    : NSDecimalNumber = 0
    var woo_status_en   : String = ""
    var woo_status_th   : String = ""
    
    var woo_product_type1 : String = ""
    var woo_product_type2 : String = ""
    var woo_order_no    : String = ""
    var woo_cus_name    : String = ""
    var woo_cus_address : String = ""
    
    var woo_cus_serv_id : String = ""
    var woo_gis         : String = ""
    var woo_longitude   : String = ""
    var woo_latitude    : String = ""
    var woo_report_date : String = ""
    
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
    var woo_working_date : String = ""
    
    init (){
        
    }
    init (dict:NSDictionary){
        self.woo_id = dict["WOO_ID"] as! NSDecimalNumber
        self.woo_workunit = dict["WOO_WORKUNIT"] as! String
        self.woo_status_en = dict["WOO_STATUS_EN"] as! String
        self.woo_product_type1 = dict["WOO_PRODUCT_TYPE1"] as! String
        self.woo_product_type2 = dict["WOO_PRODUCT_TYPE2"] as! String
        self.woo_order_no = dict["WOO_ORDER_NO"] as! String
        self.woo_latitude = dict["WOO_LATITUDE"] as! String
        self.woo_longitude = dict["WOO_LONGITUDE"] as! String
        self.woo_duration = dict["WOO_DURATION"] as! NSDecimalNumber
        self.woo_working_date = dict["WOO_WORKING_DATE"] as! String
        
        if dict["WOO_CUS_NAME"] != nil {
        self.woo_sequence = dict["WOO_SEQUENCE"] as! NSDecimalNumber
        self.woo_status_th = dict["WOO_STATUS_TH"] as! String
        

        self.woo_cus_name = dict["WOO_CUS_NAME"] as! String
        self.woo_cus_address = dict["WOO_CUS_ADDRESS"] as! String
        
        self.woo_cus_serv_id = dict["WOO_CUS_SERV_ID"] as! String
        self.woo_gis = dict["WOO_GIS"] as! String
       
        self.woo_report_date = dict["WOO_REPORT_DATE"]  as! String
        
        self.woo_test_result = dict["WOO_TEST_RESULT"] as! String
        self.woo_fault_desc = dict["WOO_FAULT_DESC"] as! String
        self.woo_note = dict["WOO_NOTE"] as! String
        self.woo_reported_by = dict["WOO_REPORTED_BY"] as! String
        self.woo_contact = dict["WOO_CONTACT"] as! String
        
        self.woo_dispatcher = dict["WOO_DISPATCHER"] as! String
        self.woo_tie = dict["WOO_TIE"] as! String
        self.woo_pri = dict["WOO_PRI"] as! String
        self.woo_cab = dict["WOO_CAB"] as! String
        self.woo_sec = dict["WOO_SEC"] as! String
        
        self.woo_dp = dict["WOO_DP"] as! String
        self.woo_pin = dict["WOO_DP"] as! String
        self.woo_dw = dict["WOO_DW"] as! String
        self.woo_adsl_info = dict["WOO_ADSL_INFO"] as! String
        self.woo_adsl_system = dict["WOO_ADSL_SYSTEM"] as! String
        
        self.woo_adsl_network = dict["WOO_ADSL_NETWORK"] as! String
        self.woo_adsl_speed = dict["WOO_ADSL_SPEED"] as! String
        self.woo_router_brand = dict["WOO_ROUTER_BRAND"] as! String
        self.woo_port = dict["WOO_PORT"] as! String
        self.woo_modem_brand = dict["WOO_MODEM_BRAND"] as! String
        
        self.woo_slotln = dict["WOO_SLOTLN"] as! String
        self.woo_portln = dict["WOO_PORTLN"] as! String
        self.woo_exchange = dict["WOO_EXCHANGE"] as! String
        }
        
    }
    
    
    
}
