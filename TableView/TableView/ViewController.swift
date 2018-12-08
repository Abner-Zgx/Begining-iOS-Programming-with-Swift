//
//  ViewController.swift
//  TableView
//
//  Created by xiang on 2018/12/6.
//  Copyright © 2018 xiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    // NB: hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func covertToImageNameBy(restaurantName: String) -> String {
        // trim white space and convert to lowercase
        return restaurantName.replacingOccurrences(of: " ", with: "").lowercased()
    }

}


// MARK: Deal with apperance of the table view
extension ViewController: UITableViewDelegate {
    
}

// MARK: Link the data to the table view
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows in the section
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "DATACELL"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: covertToImageNameBy(restaurantName: restaurantNames[indexPath.row]))
        
        print("indexPath:\(indexPath)")
        print("row:\(indexPath.row)")
        
        return cell
        
        
    }
    
    
}

