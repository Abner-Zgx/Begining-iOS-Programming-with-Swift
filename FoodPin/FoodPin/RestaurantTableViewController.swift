//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by xiang on 2018/12/6.
//  Copyright © 2018 xiang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantNameImageMap = [
        "Cafe Deadend": "cafedeadend",
        "Homei":"homei",
        "Teakha": "teakha",
        "Cafe Loisl": "cafeloisl",
        "Petite Oyster": "petiteoyster",
        "For Kee Restaurant":"forkeerestaurant",
        "Po's Atelier":"posatelier",
        "Bourke Street Bakery":"bourkestreetbakery",
        "Haigh's Chocolate":"haighschocolate",
        "Palomino Espresso":"palominoespresso",
        "Upstate":"upstate",
        "Traif": "traif",
        "Graham Avenue Meats And Deli": "grahamavenuemeats",
        "Waffle & Wolf": "wafflewolf",
        "Five Leaves": "fiveleaves",
        "Cafe Lore": "cafelore",
        "Confessional": "confessional",
        "Barrafina": "barrafina",
        "Donostia": "donostia",
        "Royal Oak": "royaloak",
        "CASK Pub and Kitchen": "caskpubkitchen"
    ]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    
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
        return restaurantNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellID = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RestaurantTableViewCell
        
        let restaurantName = restaurantNames[indexPath.row]
        let location = restaurantLocations[indexPath.row]
        let type = restaurantTypes[indexPath.row]
        
        // Update label and image
        cell.nameLabel.text = restaurantName
        cell.locationLabel.text = location
        cell.typeLabel.text = type
        cell.thumnailImageView.image = UIImage(named: restaurantNameImageMap[restaurantName] ?? "restaurant")
        
        // Update checkin
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    // MARK: - Did Select
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
    
    //     MARK: - Delete by Swipe
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
    
    // MARK: - Swipe left
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Delete
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completeHandler) in
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completionHandler to dismiss the action button
            completeHandler(true)
        }
        deleteAction.backgroundColor = UIColor(displayP3Red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        
        // Share
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completeHandler) in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.restaurantNameImageMap[self.restaurantNames[indexPath.row]] ?? "restuarant" ) {
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
    
    // MARK: - Swipe right
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInOrOutAction = UIContextualAction(style: .normal, title: "CheckIn") { (action, sourceView, completeHandle) in
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
            completeHandle(true)
        }
        checkInOrOutAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        checkInOrOutAction.image = UIImage(named: self.restaurantIsVisited[indexPath.row] ? "undo" : "tick")
        
        let swipeActionConfiguration = UISwipeActionsConfiguration(actions: [checkInOrOutAction])
        return swipeActionConfiguration
        
    }
    
    // MARK: - Pass Data to RestaurantDetailViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! RestaurantDetailViewController
                destinationViewController.restaurantImageName = restaurantNameImageMap[restaurantNames[indexPath.row]] ?? "restaurant"
                destinationViewController.restaurantName = restaurantNames[indexPath.row]
                destinationViewController.restaurantLocation = restaurantLocations[indexPath.row]
                destinationViewController.restaurantType = restaurantTypes[indexPath.row]
            }
        }
    }
}
