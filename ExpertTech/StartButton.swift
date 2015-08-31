//
//  StartDoneButton.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/23/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class StartButton: UIButton {
    required init?(coder aDecoder: (NSCoder!)) {
        
        super.init(coder: aDecoder)
        layer.bounds = CGRectMake(0, 0, 150, 35)
        layer.borderWidth = 1.0;
        layer.cornerRadius = 6.0;
        layer.borderColor = Constants.Color.Blue.CGColor
        self.tintColor = UIColor.whiteColor()
        self.setTitle("Start", forState: UIControlState.Normal)
        self.setTitle("Start ", forState: UIControlState.Highlighted)
        self.setTitleColor(Constants.Color.Blue, forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
    }
    
    override var enabled:Bool {
        get {
            return super.enabled
        }
        set {
            if newValue {
                layer.borderColor = Constants.Color.Blue.CGColor
                self.setTitleColor(Constants.Color.Blue, forState: UIControlState.Normal)
            }else {
                layer.borderColor = UIColor.grayColor().CGColor
                self.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
                
            }
            super.enabled = newValue
        }
    }
    
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                backgroundColor = Constants.Color.Blue
            }
            else {
                backgroundColor = UIColor.whiteColor()
            }
            super.highlighted = newValue
        }
    }


}
