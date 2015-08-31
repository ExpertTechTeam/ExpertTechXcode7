//
//  Constants.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/10/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//
import UIKit
import Foundation
struct Constants {
    struct Color {
        static let Blue:UIColor = UIColor(hex: 0x0F69A0)
        static let LightGray:UIColor = UIColor(hex : 0xE6EDF0)
        static let BlueFont:UIColor = UIColor(hex: 0x2778AA)
        static let LightGray_BG:UIColor = UIColor(hex:0xe6e6e6)
        static let toolbar_bg:UIColor = UIColor(hex: 0xf8f8f8)
        static let midnightblue:UIColor = UIColor(hex: 0x526e7f)
    }
    struct WorkOrderList {
        static let workOrder1 = WorkOrder(woo_id: 0, woo_lat: "13.746203", woo_lng: "100.522836")
        static let workOrder2 = WorkOrder(woo_id: 1, woo_lat: "13.752036", woo_lng: "100.521985")
        static let workOrder3 = WorkOrder(woo_id: 2, woo_lat: "13.747647", woo_lng: "100.521483")
        static let workOrderList:[WorkOrder] = [workOrder1,workOrder2,workOrder3]
        
    }
    
}