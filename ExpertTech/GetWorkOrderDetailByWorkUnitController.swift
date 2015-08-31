//
//  GetWorkOrderDetailByWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation


class GetWorkOrderDetailByWorkUnitController : NSObject, WLDelegate{
    
    var feedsArray = []
    
    var callerView1 : PopOverDetailMapTableViewController = PopOverDetailMapTableViewController()
    var callerView2 : DetailWorkOrderTableViewController = DetailWorkOrderTableViewController()
    
    var isFromMap:Bool = false
    
    func getFromSelectMap(workOrderId: NSDecimalNumber, uiView: PopOverDetailMapTableViewController){
        self.isFromMap = true
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderDetailByWorkUnit")
        invocationData.parameters = [workOrderId]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
        self.callerView1 = uiView
        
    }
    func getFromSelectMenu(workOrderId: NSDecimalNumber, uiView: DetailWorkOrderTableViewController){
        self.isFromMap = false
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderDetailByWorkUnit")
        invocationData.parameters = [workOrderId]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        self.callerView2 = uiView
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("[GetWorkOrderDetailByWorkUnitController] OnSuccess")
        feedsArray = response.getResponseJson()["resultSet"] as! NSArray
        print("\(feedsArray.count)")
        if isFromMap {
            self.callerView1.updateView(feedsArray)
        }else{
            self.callerView2.updateView(feedsArray)
        }
        
        
    }
    
    func onFailure(response: WLFailResponse!) {
         print("[GetWorkOrderDetailByWorkUnitController] OnFailure")
    }
    
}