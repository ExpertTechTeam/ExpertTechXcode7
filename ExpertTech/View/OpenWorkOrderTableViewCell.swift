//
//  WorkOrderTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class OpenWorkOrderTableViewCell: UITableViewCell {
    @IBOutlet weak var vSequence:UILabel!
    @IBOutlet weak var vOrderType1:UILabel!
    @IBOutlet weak var vOrderType2:UILabel!
    @IBOutlet weak var vTime: UILabel!
    @IBOutlet weak var vSequenceImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.vSequence.textColor = Constants.Color.Blue
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
            self.vOrderType1.textColor = Constants.Color.Blue
            self.vOrderType2.textColor = Constants.Color.Blue
            self.vTime.textColor = UIColor.grayColor()
        }
    }
    

}
