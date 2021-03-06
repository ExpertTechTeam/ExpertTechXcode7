//
//  LoginViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

import LocalAuthentication

class LoginViewController: UIViewController {
    
    enum LAError : Int {
        case AuthenticationFailed
        case UserCancel
        case UserFallback
        case SystemCancel
        case PasscodeNotSet
        case TouchIDNotAvailable
        case TouchIDNotEnrolled
    }
    
    @IBOutlet weak var vWhiteView: UIView!
    @IBOutlet weak var vHeaderView: UIView!
    @IBOutlet weak var vSignInBtn: UIButton!
    @IBOutlet weak var vUsernameTxtField: UITextField!
    @IBOutlet weak var vPasswordTxtField: UITextField!
    
    var loginResult : NSArray = []
    
    var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()        // Do any additional setup after loading the view.
        self.vWhiteView.layer.cornerRadius = 5
        self.vHeaderView.layer.cornerRadius = 5
        self.vSignInBtn.layer.cornerRadius = 5
        self.vUsernameTxtField.layer.cornerRadius = 5
        self.vPasswordTxtField.layer.cornerRadius = 5
        self.vUsernameTxtField.leftView = UIView(frame: CGRectMake(0, 0, 10, 20))
        self.vUsernameTxtField.leftViewMode = UITextFieldViewMode.Always
        self.vPasswordTxtField.leftView = UIView(frame: CGRectMake(0, 0, 10, 20))
        self.vPasswordTxtField.leftViewMode = UITextFieldViewMode.Always

    }
    
    override func viewDidAppear(animated: Bool) {
         //authenticateUser()
        self.vUsernameTxtField.text = ""
        self.vPasswordTxtField.text = ""
    }
    /*
    func authenticateUser() {
        let context:LAContext = LAContext();
        do {
            try context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics)
            let reason = "Scan fingerprint to login"
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply: {
                (success: Bool, authenticationError: NSError?) -> Void in
                
                // check whether evaluation of fingerprint was successful
                if success {
                    // fingerprint validation was successful
                    print("Fingerprint validated.")
                    
                } else {
                    // fingerprint validation failed
                    // get the reason for validation failure
                    var failureReason = "unable to authenticate user"
                    switch authenticationError!.code {
                    case LAError.AuthenticationFailed.rawValue:
                        failureReason = "authentication failed"
                    case LAError.UserCancel.rawValue:
                        failureReason = "user canceled authentication"
                    case LAError.SystemCancel.rawValue:
                        failureReason = "system canceled authentication"
                    case LAError.PasscodeNotSet.rawValue:
                        failureReason = "passcode not set"
                    case LAError.UserFallback.rawValue:
                        failureReason = "user chose password"
                    default:
                        failureReason = "unable to authenticate user"
                    }
                    print("Fingerprint validation failed: \(failureReason).");
                }
            })
        } catch {
            
        }
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func login(){
        let username = self.vUsernameTxtField!.text
        let password = self.vPasswordTxtField!.text
        
        LoginController().login(username!, password: password!, uiView: self)
    }
    
    @IBAction func logout(segue : UIStoryboardSegue){
        print("Logout")
    }

    func updateView(response: NSArray){

        self.loginResult = response
        
        print("Found the result from LoginController : \(response.count) item")
        if self.loginResult.count > 0 {
            print("login passed")
            performSegueWithIdentifier("loginSegue", sender: self.loginResult[0])
        }else{
            print("login failed")
            let alert = UIAlertController(title: "Login Failed", message: "Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginSegue"{
            let item = sender as! NSDictionary
            let user = Profile(dict: item)
            
            prefs.setObject(user.pro_username, forKey: "USERNAME")
            prefs.setObject("\(user.pro_fname) \(user.pro_lname)", forKey: "NAME")
            prefs.setObject(user.pro_workunit, forKey: "WORKUNIT")
            prefs.setInteger(1, forKey: "ISLOGGEDIN")
            prefs.setBool(true, forKey: "AUTHEN")
            prefs.synchronize()
            
            let fname: String = user.pro_fname
            let lname: String = user.pro_lname
            let workunit: String = user.pro_workunit
            
            print("FIRST NAME: \(fname)")
            print("LAST NAME:  \(lname)")
            print("WORK UNIT:  \(workunit)")
            let navMainPageVC = segue.destinationViewController as! UINavigationController
            let mainPageVC = navMainPageVC.topViewController as! MainPageViewController
            mainPageVC.vTechnicianName = "\(fname) \(lname)/\(workunit)"
            mainPageVC.vWorkUnit = workunit
            
            
        }
    }
}
