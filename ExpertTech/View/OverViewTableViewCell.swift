//
//  OverViewTableViewCell.swift
//  ExpertTech
//
//  Created by Kewalin Sakawattananon on 7/27/2558 BE.
//  Copyright © 2558 IBM. All rights reserved.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {
    @IBOutlet weak var vImageTitle:UIImageView!
    @IBOutlet weak var vTitle:UILabel!
    @IBOutlet weak var vStatus:UILabel!
    
    var isSelectedVehicle:Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let bgView = UIView()
        if selected  {
            bgView.backgroundColor = Constants.Color.Blue
            self.selectedBackgroundView = bgView
            if isSelectedVehicle {
                self.vStatus.textColor = UIColor.greenColor()
            }else{
                self.vStatus.textColor = UIColor.whiteColor()
            }
            //
            self.vTitle.textColor = UIColor.whiteColor()
        }else{
            bgView.backgroundColor = UIColor.whiteColor()
            self.selectedBackgroundView = bgView
            if isSelectedVehicle {
                self.vStatus.textColor = UIColor.greenColor()
            }else{
                self.vStatus.textColor = UIColor.grayColor()
            }
            self.vTitle.textColor = Constants.Color.Blue
        }
        // Configure the view for the selected state
    }
}
