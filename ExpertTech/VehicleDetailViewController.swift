//
//  VehicleDetailViewController.swift
//  ExpertTechStaticUI
//
//  Created by Warunee Phattharakijwanich on 8/25/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit
protocol communicationControllerVehicle{
    func backFromVehicle()
}

class VehicleDetailViewController: UIViewController {

    @IBOutlet weak var vSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var vVehicleContainer: UIView!
    
    @IBOutlet weak var vPicklistContainer: UIView!
    
    var delegate: communicationControllerVehicle? = nil
    
    @IBAction func segmentMethod(sender: AnyObject) {
        if vSegmentControl.selectedSegmentIndex == 0 {
            vPicklistContainer.hidden = false
            vVehicleContainer.hidden = true
        }
        else
        {
            vPicklistContainer.hidden = true
            vVehicleContainer.hidden = false
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vSegmentControl.selectedSegmentIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onClickReserveVehicle(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        self.delegate?.backFromVehicle()
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
