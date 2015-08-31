//
//  UpdateWorkOrderStatusController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class UpdateWorkOrderStatusController : NSObject, WLDelegate {
    
    func update(status: String, duration: Double, updatedTime: NSDate, workOrderId: Int){
        
//        parameters : [status, duration, updatedtime, workorderid]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "updateWorkOrderStatus")
        invocationData.parameters = [status, duration, updatedTime, workOrderId]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
    }
    
    
    func onSuccess(response: WLResponse!) {
        print("[UpdateWorkOrderStatusController] OnSuccess")

        
    }
    
    func onFailure(response: WLFailResponse!) {
        print("[UpdateWorkOrderStatusController] OnFailure")

        
    }
    
}