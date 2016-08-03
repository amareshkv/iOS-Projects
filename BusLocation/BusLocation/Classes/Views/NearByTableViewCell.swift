//
//  NearByTableViewCell.swift
//  BusLocation
//
//  Created by Amaresh Kundeppady Venkappa on 03/08/16.
//  Copyright © 2016 Amaresh K V. All rights reserved.
//

import UIKit

class NearByTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImgView : UIImageView?
    
    @IBOutlet weak var titleLabel : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
