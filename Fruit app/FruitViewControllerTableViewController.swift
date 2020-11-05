//
//  FruitViewControllerTableViewController.swift
//  Fruit app
//
//  Created by NDHU_CSIE on 2020/10/30.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class FruitViewControllerTableViewController: UITableViewController {
    
    @IBOutlet var myLabel : UILabel?
    
    var fruits = ["watermelon","apple","orange","strawberry","pear"]
    var price = [500,100,90,200,150]
    
    var fruitIsVisited = Array(repeating: false, count: 5)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! FruitTableViewCell
        // Configure the cell...
        cell.nameLabel?.text = fruits[indexPath.row]
        cell.priceLabel?.text = String(price[indexPath.row])
        if fruitIsVisited[indexPath.row] {
        cell.accessoryType = .checkmark
        } else {
        cell.accessoryType = .none
        }
         
        return cell
        // Configure the cell...
    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        fruitIsVisited[indexPath.row] = !fruitIsVisited[indexPath.row]
        cell?.accessoryType = fruitIsVisited[indexPath.row] ? .checkmark : .none
            
        var totalPrice = 0
            for i in 0...(fruits.count-1){
                if fruitIsVisited[i]{
                    totalPrice += price[i]
                }
            }
            myLabel?.text = "Total price = " + String(totalPrice)
        
        
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
               
       let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (action, sourceView, completionHandler) in
                   
       let cell = tableView.cellForRow(at: indexPath) as! FruitTableViewCell
       self.fruitIsVisited[indexPath.row] = (self.fruitIsVisited[indexPath.row]) ? false : true
       cell.accessoryType = self.fruitIsVisited[indexPath.row] ? .checkmark : .none
                   
       completionHandler(true)
       }
               
       let checkInIcon = fruitIsVisited[indexPath.row] ? "arrow.uturn.left" : "checkmark"
       checkInAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
       checkInAction.image = UIImage(systemName: checkInIcon)
               
       let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
             
               
       return swipeConfiguration
       }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
