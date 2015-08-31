//
//  InsertFeedbackController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class InsertCustFeedbackController : NSObject, WLDelegate {
    
    
    func insert(workUnit: String, workOrderId: Int, timeless: Int, helpful: Int, quantity: Int, commu: Int, overall: Int, createdDate: String){
        //parameters : [workunit, workorderid, timeless, helpful, quantity, commu, overall, createddate]
        
        print("---------- InsertCustFeedbackController ----------")
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "insertCustFeedback")
        invocationData.parameters = [workUnit, workOrderId, timeless, helpful, quantity, commu, overall, createdDate]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("[InsertCustFeedbackController] onSuccess")
    }
    
    func onFailure(response: WLFailResponse!) {
        print("[InsertCustFeedbackController] onFailure")
        
    }
    
    
}