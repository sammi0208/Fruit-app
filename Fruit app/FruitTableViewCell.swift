//
//  FruitTableViewCell.swift
//  Fruit app
//
//  Created by NDHU_CSIE on 2020/10/30.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class FruitTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
