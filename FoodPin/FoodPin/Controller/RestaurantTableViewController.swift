//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by xiang on 2018/12/6.
//  Copyright © 2018 xiang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited:false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
    ]
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // tableView适应iPad，使talbeView不要太大
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // 使用iOS11之后的大标题
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RestaurantTableViewCell
        
        let restaurantName = restaurants[indexPath.row].name
        let location = restaurants[indexPath.row].location
        let type = restaurants[indexPath.row].type
        let image = restaurants[indexPath.row].image
        
        // Update label and image
        cell.nameLabel.text = restaurantName
        cell.locationLabel.text = location
        cell.typeLabel.text = type
        cell.thumnailImageView.image = UIImage(named: image ?? "restaurant")
        
        // Update checkin
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark : .none
        
        return cell
    }
    
    // Did Select
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //        // Display option menu
    //        let optionMenu = UIAlertController(title: "Hello", message: "What?", preferredStyle: .actionSheet)
    //        present(optionMenu, animated: true, completion: nil)
    //
    //        // Cancel
    //        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //        optionMenu.addAction(cancelAction)
    //
    //        // Call
    //        let callActionHandler = { (action: UIAlertAction) -> Void in
    //            let alertMessage = UIAlertController(title: "Service Unavailalbe", message: "Sorry, the call feature is not available. Please retry later", preferredStyle: .alert)
    //            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    //            alertMessage.addAction(alertAction)
    //            self.present(alertMessage, animated: true, completion: nil)
    //        }
    //        let callAction = UIAlertAction(title: "Call", style: .default, handler: callActionHandler)
    //        optionMenu.addAction(callAction)
    //
    //        // Check-in
    //        let checkInAction = UIAlertAction(title: "Check", style: .default) { (action: UIAlertAction) -> Void in
    //
    //            self.restaurantIsVisited[indexPath.row] = true
    //            let cell = tableView.cellForRow(at: indexPath)
    //            cell?.accessoryType = .checkmark
    //
    //        }
    //        optionMenu.addAction(checkInAction)
    //
    //        // Uncheck
    //        let uncheckAction = UIAlertAction(title: "Uncheck", style: .destructive) { (action: UIAlertAction) -> Void in
    //            self.restaurantIsVisited[indexPath.row] = false
    //            let cell = tableView.cellForRow(at: indexPath)
    //            cell?.accessoryType = .none
    //        }
    //        optionMenu.addAction(uncheckAction)
    //
    //        // Deselect the row
    //        tableView.deselectRow(at: indexPath, animated: true)
    //
    //        // Adapt iPad
    //        if let popoverController = optionMenu.popoverPresentationController {
    //            if let cell = tableView.cellForRow(at: indexPath) {
    //                popoverController.sourceView = cell
    //                popoverController.sourceRect = cell.bounds
    //            }
    //        }
    //    }
    
    // Delete by Swipe
    //    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    //
    //        // Delete
    //        if editingStyle == .delete {
    //            restaurantNames.remove(at: indexPath.row)
    //            restaurantLocations.remove(at: indexPath.row)
    //            restaurantIsVisited.remove(at: indexPath.row)
    //            restaurantTypes.remove(at: indexPath.row)
    //            tableView.deleteRows(at: [indexPath], with: .left) //
    //        }
    //    }
    
    // MARK: - Table view delegate
    
    // Swipe left
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Delete
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completeHandler) in
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completionHandler to dismiss the action button
            completeHandler(true)
        }
        deleteAction.backgroundColor = UIColor(displayP3Red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        
        // Share
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completeHandler) in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            // Adapt iPad
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController, animated: true, completion: nil)
            completeHandler(true)
        }
        shareAction.backgroundColor = UIColor(displayP3Red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        return swipeActionConfiguration
    }
    
    // Swipe right
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInOrOutAction = UIContextualAction(style: .normal, title: "CheckIn") { (action, sourceView, completeHandle) in
            self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restaurants[indexPath.row].isVisited ? .checkmark : .none
            completeHandle(true)
        }
        checkInOrOutAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        checkInOrOutAction.image = UIImage(named: self.restaurants[indexPath.row].isVisited ? "undo" : "tick")
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [checkInOrOutAction])
        return swipeActionConfiguration
        
    }
    
    // MARK: - Navigation
    
    // Pass Data to RestaurantDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! RestaurantDetailViewController
                destinationViewController.restaurant = restaurants[indexPath.row]
            }
        }
    }
}
