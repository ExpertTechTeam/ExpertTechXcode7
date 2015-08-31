//
//  DetailWorkOrderViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/2/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class DetailWorkOrderViewController: UIViewController, UISplitViewControllerDelegate{
    @IBOutlet weak var vStartBarBtn: UIBarButtonItem!
    @IBOutlet weak var vDoneBarBtn: UIBarButtonItem!
    @IBOutlet weak var vInstructionBarBtn: UIBarButtonItem!
    @IBOutlet weak var vExpertBarBtn: UIBarButtonItem!
    @IBOutlet weak var vVideoBarBtn: UIBarButtonItem!
    @IBOutlet weak var vStartBtn: StartButton!
    @IBOutlet weak var vDoneBtn: DoneButton!
    @IBOutlet weak var vToolbar: UIToolbar!
    @IBOutlet weak var vTimeCount: UILabel!
    @IBOutlet weak var vSegmentControl: UISegmentedControl!
    @IBOutlet weak var vOverview: UIView!
    @IBOutlet weak var vLocation: UIView!
    @IBOutlet weak var vNotes: UIView!
    @IBOutlet weak var vInstructions: UIView!
    
    var isSelectedVehicle:Bool = false
    var indexNumber:Int = 0
    var workOrderId:NSDecimalNumber = 0
    var hideMaster:Bool = false
    var startTime = NSTimeInterval()
    var timer:NSTimer = NSTimer()
    var elapsedTime: NSTimeInterval!
    var duration:NSDecimalNumber!
    var strMinutes:String!
    var strSeconds:String!
    let flexibleBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
    var curWorkOrder:WorkOrder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.splitViewController?.delegate = self
        self.vToolbar.setItems([vInstructionBarBtn,vExpertBarBtn,vVideoBarBtn,flexibleBarBtn,vDoneBarBtn,vStartBarBtn], animated: false)
        self.vDoneBtn.hidden = true
        self.vTimeCount.hidden = true
        self.vSegmentControl.selectedSegmentIndex = 0
        self.vStartBarBtn.enabled = isSelectedVehicle
        //self.onChangeSegment(vSegmentControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - splitview delegate
    func splitViewController(svc: UISplitViewController, shouldHideViewController vc: UIViewController, inOrientation orientation: UIInterfaceOrientation) -> Bool {
        return hideMaster
    }
    
    // MARK: - user action
    @IBAction func onChangeSegment(sender: AnyObject) {
        switch vSegmentControl.selectedSegmentIndex {
            case 1 :
                print("1")
                self.vOverview.hidden = true
                self.vLocation.hidden = false
                self.vNotes.hidden = true
                self.vInstructions.hidden = true
            case 2 :
                print("2")
                self.vOverview.hidden = true
                self.vLocation.hidden = true
                self.vNotes.hidden = false
                self.vInstructions.hidden = true
            case 3 :
                print("3")
                self.vOverview.hidden = true
                self.vLocation.hidden = true
                self.vNotes.hidden = true
                self.vInstructions.hidden = false
            default :
                print("0")
                self.vOverview.hidden = false
                self.vLocation.hidden = true
                self.vNotes.hidden = true
                self.vInstructions.hidden = true

        }
    }
    
    @IBAction func onClickStart(sender :AnyObject!){
        print("START")
        let startBtn = sender as! StartButton
        startBtn.hidden = true
        vDoneBtn.hidden = false
        vTimeCount.hidden = false
        vToolbar.setItems([vInstructionBarBtn,vExpertBarBtn,vVideoBarBtn,flexibleBarBtn,vStartBarBtn,vDoneBarBtn], animated: false)
        self.startWork()
        
    }
    
    @IBAction func onClickDone(sender:AnyObject){
        print("DONE")
        performSegueWithIdentifier("technicalReportSegue", sender: sender)
    }
    
    
    
    func startWork(){
        hideMaster = !hideMaster;
        let animations: () -> Void = {
            self.splitViewController?.preferredDisplayMode = .PrimaryHidden
            self.splitViewController?.viewWillLayoutSubviews()
            self.splitViewController?.view.layoutSubviews()
            
        }
        UIView.animateWithDuration(0.3, delay: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: animations) { (Bool) -> Void in
            self.startCount()
        }
        
    }
    
    /*
    @IBAction func startWork() {
        self.startCount()
        self.vTimeCount.hidden = false
        self.vStartButton.hidden = true
        self.hideMaster = !self.hideMaster
        let spv:UISplitViewController = self.splitViewController!
        spv.view.setNeedsLayout()
        spv.delegate = nil;
        spv.delegate = self;
    //  spv.willRotateToInterfaceOrientation(self.interfaceOrientation, duration: 2000)
    }
    @IBAction func stopWork(sender:AnyObject?){
        self.stopCount()
    
    }
    */
    func startCount(){
        if (!timer.valid) {
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        }
    }
    
    func stopCount(){
        timer.invalidate()
        duration = NSDecimalNumber(string: "\(strMinutes).\(strSeconds)")
        print("Duration : \(duration)")

       
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        //Find the difference between current time and start time.
        self.elapsedTime = currentTime - startTime
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        self.elapsedTime = self.elapsedTime - (NSTimeInterval(minutes) * 60)
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        self.elapsedTime =  self.elapsedTime - NSTimeInterval(seconds)
        //add the leading zero for minutes, seconds and store them as string constants
        self.strMinutes = String(format: "%02d", minutes)
        self.strSeconds = String(format: "%02d", seconds)
        //concatenate minuets, seconds as assign it to the UILabel
        self.vTimeCount.text = "\(self.strMinutes):\(self.strSeconds)"

    }
    
    @IBAction func cancelFromTechnicalReport(segue:UIStoryboardSegue){
        print("cancel to complete work order")
        startCount()
    }
    
    @IBAction func completedWorkOrder(segue:UIStoryboardSegue){
        print("completed work order")
        stopCount()
        let dict: [String : AnyObject] = ["indexNumber" : indexNumber]
        NSNotificationCenter.defaultCenter().postNotificationName("completedWorkOrder", object: nil, userInfo: dict)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailWorkOrderSegue"{
            let controller = (segue.destinationViewController as! DetailWorkOrderTableViewController)
            controller.workOrderId = self.workOrderId
            controller.indexNumber = self.indexNumber
            //controller.curWorkOrder = self.curWorkOrder
            print("detailWorkOrderSegue")
        }
    }
    
    
}
