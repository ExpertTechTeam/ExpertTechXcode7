//
//  LoginController.swift
//  ExpertTech
//
//  Created by Pannray Samanphanchai on 8/13/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import Foundation
import IBMMobileFirstPlatformFoundation

class LoginController : NSObject, WLDelegate {
    
    var feedsArray = []
    var callerView : LoginViewController = LoginViewController()
    
    func login(username: String, password: String, uiView: LoginViewController){
        print("----------- [LoginController] -------------")
        
        let invocationData = WLProcedureInvocationData(adapterName: "MySQLDBAdapter", procedureName: "login")
        invocationData.parameters = [username, password]
        WLClient.sharedInstance().invokeProcedure(invocationData, withDelegate: self)
        
        self.callerView = uiView
        
    }
    
    func onSuccess(response: WLResponse!) {
        print("[LoginController] onSuccess")
        feedsArray = response.getResponseJson()["resultSet"] as! NSArray
        self.callerView.updateView(feedsArray)
        
        
    }
    
    func onFailure(response: WLFailResponse!) {
        print("[LoginController] onFailure")
    }

    
}