//
//  Profile.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 7/28/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation

public class Profile{
    
    var pro_id       : NSDecimalNumber = 0
    var pro_fname    : String = ""
    var pro_lname    : String = ""
    var pro_username : String = ""
    var pro_password : String = ""
    var pro_workunit : String = ""
    var pro_created_date : String = ""
    
    init(dict : NSDictionary){
        self.pro_id = dict["PRO_ID"] as! NSDecimalNumber
        self.pro_fname = dict["PRO_FNAME"] as! String
        self.pro_lname = dict["PRO_LNAME"] as! String
        self.pro_username = dict["PRO_USERNAME"] as! String
        self.pro_password = dict["PRO_PASSWORD"] as! String
        self.pro_workunit = dict["PRO_WORKUNIT"] as! String
        self.pro_created_date = dict["PRO_CREATED_DATE"] as! String
    }
    
    
}
