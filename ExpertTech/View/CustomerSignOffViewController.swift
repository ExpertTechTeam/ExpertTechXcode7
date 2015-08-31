//
//  CustomerSignOffViewController.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/4/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class CustomerSignOffViewController: UIViewController {

    var lastPoint:CGPoint!
    var mouseSwiped:Bool!
    @IBOutlet weak var vTempDrawImage:UIImageView!
    @IBOutlet weak var vClearButton:UIButton!
    @IBOutlet weak var vUnderlineTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = Constants.Color.LightGray_BG.CGColor
        border.frame = CGRect(x: 0, y: self.vUnderlineTxtField.frame.size.height - width, width:  self.vUnderlineTxtField.frame.size.width, height: self.vUnderlineTxtField.frame.size.height)
        
        border.borderWidth = width
        self.vUnderlineTxtField.layer.addSublayer(border)
        self.vUnderlineTxtField.layer.masksToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        mouseSwiped = false
        let touch = touches.first
        lastPoint = touch?.locationInView(self.vTempDrawImage)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        mouseSwiped = true
        let touch = touches.first
        let currentPoint = touch?.locationInView(self.vTempDrawImage)
        
        UIGraphicsBeginImageContext(self.vTempDrawImage.frame.size);
        self.vTempDrawImage.image?.drawInRect(CGRectMake(0, 0, self.vTempDrawImage.frame.size.width, self.vTempDrawImage.frame.size.height))
        CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
        CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), currentPoint!.x, currentPoint!.y);
        CGContextSetLineCap(UIGraphicsGetCurrentContext(), CGLineCap.Round);
        CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 4.0 );
        CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
        CGContextSetBlendMode(UIGraphicsGetCurrentContext(), CGBlendMode.Normal);
        
        CGContextStrokePath(UIGraphicsGetCurrentContext());
        self.vTempDrawImage!.image = UIGraphicsGetImageFromCurrentImageContext();
        self.vTempDrawImage.alpha = 1.0
        UIGraphicsEndImageContext();
        
        lastPoint = currentPoint;
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(!mouseSwiped) {
            UIGraphicsBeginImageContext(self.vTempDrawImage.frame.size);
            self.vTempDrawImage.image?.drawInRect(CGRectMake(0, 0, self.vTempDrawImage.frame.size.width, self.vTempDrawImage.frame.size.height))
            CGContextSetLineCap(UIGraphicsGetCurrentContext(), CGLineCap.Round);
            CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 4.0 );
            CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 0.0, 0.0, 0.0, 1.0);
            CGContextMoveToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), lastPoint.x, lastPoint.y);
            CGContextStrokePath(UIGraphicsGetCurrentContext());
            CGContextFlush(UIGraphicsGetCurrentContext());
            self.vTempDrawImage.image = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
        }
        
        //UIGraphicsBeginImageContext(self.mainImage.frame.size);
        //  [self.mainImage.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
        self.vTempDrawImage.image?.drawInRect(CGRectMake(0, 0, self.vTempDrawImage.frame.size.width, self.vTempDrawImage.frame.size.height))
        //  self.mainImage.image = UIGraphicsGetImageFromCurrentImageContext();
        //  self.tempDrawImage.image = nil;
        UIGraphicsEndImageContext();
    }
    
    @IBAction func onClearImage() {
        // UIGraphicsBeginImageContext(self.view.frame.size);
        self.vTempDrawImage.image = nil
        UIGraphicsEndImageContext();
    }
    

}
