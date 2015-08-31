//
//  TechReportTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/23/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class TechReportTableViewCell: UITableViewCell {
    var width:CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        width = self.bounds.size.width
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let bgView = UIView()
        if selected == true {
            bgView.backgroundColor = Constants.Color.Blue
            self.selectedBackgroundView = bgView
        }else{
            bgView.backgroundColor = UIColor.whiteColor()
            self.selectedBackgroundView = bgView
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bounds = CGRectMake(self.bounds.origin.x,
            self.bounds.origin.y,
            self.width - 80,
            self.bounds.size.height);
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = Constants.Color.LightGray.CGColor
        
    }
}
