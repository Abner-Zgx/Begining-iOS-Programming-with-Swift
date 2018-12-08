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
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change the navigation title mode
        navigationItem.largeTitleDisplayMode = .never
        
        // 必须在viewDidLoad之后做，否则会nil
        restaurantImageView.image = UIImage(named: restaurant.image)
        nameLabel.text = restaurant.name
        loacationLabel.text = restaurant.location
        typeLabel.text = restaurant.type
    }
    

}
