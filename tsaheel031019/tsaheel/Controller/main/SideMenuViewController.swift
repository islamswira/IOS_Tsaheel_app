//
//  SideMenuViewController.swift
//  tsaheel
//
//  Created by Mohamed Elsayed on 9/13/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit


class SideMenuViewController: UITableViewController {
    let CellLabel = ["ImageCell","MainCell","ProfileCell","PhotographerCell","Orders","settings"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
        self.revealViewController()?.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().frontViewController.revealViewController().tapGestureRecognizer()
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.revealViewController().frontViewController.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = true
        
    }
    
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("item of #\(indexPath.row)")
    }
    
}
