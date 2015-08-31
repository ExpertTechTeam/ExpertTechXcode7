//
//  CustomerFeedbackViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/4/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class CustomerFeedbackViewController: UIViewController {

    @IBOutlet weak var vTimelinessSlider: UISlider!
    @IBOutlet weak var vHelpfulnessSlider: UISlider!
    @IBOutlet weak var vQualitySlider: UISlider!
    @IBOutlet weak var vCommuSlider: UISlider!
    @IBOutlet weak var vOverallSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTouchDownTimeliness(sender: AnyObject) {
        let vSlider = sender as! UISlider
        vSlider.thumbTintColor = Constants.Color.Blue
    }
    
    @IBAction func resetAllSlider(sender: AnyObject) {
        vTimelinessSlider.value = 5.0
        vTimelinessSlider.thumbTintColor = UIColor.lightGrayColor()
        vHelpfulnessSlider.value = 5.0
        vHelpfulnessSlider.thumbTintColor = UIColor.lightGrayColor()
        vQualitySlider.value = 5.0
        vQualitySlider.thumbTintColor = UIColor.lightGrayColor()
        vCommuSlider.value = 5.0
        vCommuSlider.thumbTintColor = UIColor.lightGrayColor()
        vOverallSlider.value = 5.0
        vOverallSlider.thumbTintColor = UIColor.lightGrayColor()
    }
    
    @IBAction func onSubmitFeedback(){
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
