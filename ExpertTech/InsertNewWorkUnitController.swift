//
//  InsertNewWorkUnitController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class InsertNewWorkUnitController: NSObject, WLDelegate{
    
    
//    var callerView  //Defind callerView
    
    func insert (workUnit: String, sequence: Int, status_en: String, status_th: String, product1: String, product2: String, orderno: String, gis: String, latitude: String, longtitude: String){
        //parameters : [workunit, sequence, status, product1, product2, orderno, gis, latitude, longitude]
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "insertNewWorkUnit")
        invocationData.parameters = [workUnit, sequence, status_en, status_th, product1, product2, orderno, gis, latitude, longtitude]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
        
    }
    
    
    func onSuccess(response: WLResponse!) {
        print("[InsertNewWorkUnitController] onSuccess")
    }
    
    func onFailure(response: WLFailResponse!) {
        print("[InsertNewWorkUnitController] onFailure")
    }
}
