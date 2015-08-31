//
//  SurveyOptionViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/4/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class SurveyOptionViewController: UIViewController {

    @IBOutlet weak var vTakeSurwayBtn: UIButton!
    @IBOutlet weak var vDoNotTakeSurway: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        self.vTakeSurwayBtn.layer.cornerRadius = 6.0
        self.vDoNotTakeSurway.layer.cornerRadius = 6.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "noTakeSurveySegue"{
            let thankyouVC = segue.destinationViewController as! ThanksViewController
            thankyouVC.isHiddenBackBtn = true
        }
        
    }
    

}
