//
//  CompletedWorkOrderTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 8/24/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class CompletedWorkOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var vOrderType1:UILabel!
    @IBOutlet weak var vOrderType2:UILabel!
    @IBOutlet weak var vTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        let bgView = UIView()
        if selected == true {
            bgView.backgroundColor = Constants.Color.Blue
            self.selectedBackgroundView = bgView
            self.vOrderType1.textColor = UIColor.whiteColor()
            self.vOrderType2.textColor = UIColor.whiteColor()
            self.vTime.textColor = UIColor.whiteColor()
        }else{
            bgView.backgroundColor = UIColor.whiteColor()
            self.selectedBackgroundView = bgView
            self.vOrderType1.textColor = UIColor.grayColor()
            self.vOrderType2.textColor = UIColor.grayColor()
            self.vTime.textColor = UIColor.grayColor()
        }
    }

}
