//
//  getWorkOrderByWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class GetWorkOrderByWorkUnitController : NSObject, WLDelegate{
    
    var feedsArray = []
    var callerView : MenuTableViewController = MenuTableViewController()  //Defind callerView
    
    func get(workUnit: String, uiView: MenuTableViewController){
     //   parameters : [workunit]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "getWorkOrderByWorkUnit")
        invocationData.parameters = [workUnit]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
        callerView = uiView
        
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("[GetWorkOrderByWorkUnitController] onSuccess")
        feedsArray = response.getResponseJson()["resultSet"] as! NSArray
        print("\(feedsArray.count)")
        self.callerView.updateView(feedsArray)
        
    }
    
    func onFailure(response: WLFailResponse!) {
        
        print("[GetWorkOrderByWorkUnitController] onFailure")
        
    }
    
}
