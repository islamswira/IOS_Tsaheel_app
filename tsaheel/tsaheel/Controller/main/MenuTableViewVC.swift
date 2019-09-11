//
//  MenuTableViewVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/30/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class MenuTableViewVC: UITableViewController {

    var memStatue = ""
    var userID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        memStatue =  helper.getMEM_STATUE()!
        userID = helper.getID()!
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuCell else { return UITableViewCell() }
            cell.nameLbl.text = "تعديل العميل"
       
        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            if memStatue == "1" {
                if let normalVC = storyboard?.instantiateViewController(withIdentifier: "editNormalUserVC") as? editNormalUserVC {
                    normalVC.memStatue = memStatue
                    normalVC.userID = userID
                    present(normalVC, animated: true, completion: nil)
                }
            }else if memStatue == "2"{
                if let delivaryVC = storyboard?.instantiateViewController(withIdentifier: "editDelivaryUserVC") as? editDelivaryUserVC {
                    delivaryVC.memStatue = memStatue
                    delivaryVC.userID = userID
                    present(delivaryVC, animated: true, completion: nil)
                }
            }else if memStatue == "3"{
                if let companyVC = storyboard?.instantiateViewController(withIdentifier: "editCompanyUser") as? editCompanyUser {
                    companyVC.memStatue = memStatue
                    companyVC.userID = userID
                    present(companyVC, animated: true, completion: nil)
                }
            }
        default:
            break
        }
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
