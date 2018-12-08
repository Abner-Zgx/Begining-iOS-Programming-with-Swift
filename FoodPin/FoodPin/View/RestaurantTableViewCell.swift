//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by xiang on 2018/12/6.
//  Copyright © 2018 xiang. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumnailImageView: UIImageView! {
        didSet {
            thumnailImageView.layer.cornerRadius = thumnailImageView.bounds.width / 2
            thumnailImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
