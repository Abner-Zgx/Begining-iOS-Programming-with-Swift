//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by xiang on 2018/12/8.
//  Copyright © 2018 xiang. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var loacationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    var restaurantImageName = ""
    var restaurantName = ""
    var restaurantLocation = ""
    var restaurantType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the navigation title mode
        navigationItem.largeTitleDisplayMode = .never
        
        // 必须在viewDidLoad之后做，否则会nil
        restaurantImageView.image = UIImage(named: restaurantImageName)
        nameLabel.text = restaurantName
        loacationLabel.text = restaurantLocation
        typeLabel.text = restaurantType
    }
    

}
