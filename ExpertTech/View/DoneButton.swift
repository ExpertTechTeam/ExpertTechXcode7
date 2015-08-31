//
//  DoneButton.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/23/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class DoneButton: UIButton {
    required init?(coder aDecoder: (NSCoder!)) {
        
        super.init(coder: aDecoder)
        layer.bounds = CGRectMake(0, 0, 150, 35)
        layer.borderWidth = 1.0;
        layer.cornerRadius = 6.0;
        layer.borderColor = UIColor.redColor().CGColor
        self.tintColor = UIColor.whiteColor()
        self.setTitle("Done", forState: UIControlState.Normal)
        self.setTitle("Done ", forState: UIControlState.Highlighted)
        self.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        
    }
    override var highlighted: Bool {
        get {
            return super.highlighted
        }
        set {
            if newValue {
                backgroundColor = UIColor.redColor()
            }
            else {
                backgroundColor = UIColor.whiteColor()
            }
            super.highlighted = newValue
        }
    }

}
