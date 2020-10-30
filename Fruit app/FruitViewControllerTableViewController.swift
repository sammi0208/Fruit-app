//
//  FruitViewControllerTableViewController.swift
//  Fruit app
//
//  Created by NDHU_CSIE on 2020/10/30.
//  Copyright © 2020 NDHU_CSIE. All rights reserved.
//

import UIKit

class FruitViewControllerTableViewController: UITableViewController {
    
    var fruits = ["watermelon","apple","orange","strawberry","pear"]
    var price = ["500","100","90","200","150"]
    
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
        cell.priceLabel?.text = price[indexPath.row]
        
        if fruitIsVisited[indexPath.row] {
        cell.accessoryType = .checkmark
        } else {
        cell.accessoryType = .none
        }
         
        return cell
        // Configure the cell...
    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Create an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "Do you want to choose this one?", preferredStyle: .actionSheet)
        
        //要在ipad使用就要加這段程式碼
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        
        // Check-in action
        let checkInAction = UIAlertAction(title: "YES", style: .default, handler: {
            (action:UIAlertAction!) -> Void in

            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = .checkmark
            self.fruitIsVisited[indexPath.row] = true
        })
        optionMenu.addAction(checkInAction)
        
        //Add undo check-in action
        let uncheckInAction = UIAlertAction(title: "NO", style: .default, handler: {
            (action:UIAlertAction!) -> Void in

            let cell = tableView.cellForRow(at: indexPath)
            if self.fruitIsVisited[indexPath.row] {
                cell?.accessoryType = .none
                self.fruitIsVisited[indexPath.row] = false
            }
        })
        optionMenu.addAction(uncheckInAction)
        
        // Add actions to the menu
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)

        // Display the menu
        present(optionMenu, animated: true, completion: nil)
        
        // Deselect a row 灰底部分選了馬上消失
        tableView.deselectRow(at: indexPath, animated: false)
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
