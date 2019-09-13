//
//  EstrahatListVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/11/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class EstrahatListVC: UIViewController , UITableViewDataSource ,UITableViewDelegate {

    @IBOutlet weak var estrahatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        
        estrahatTableView.dataSource = self
        estrahatTableView.delegate = self
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if  let cell = tableView.dequeueReusableCell(withIdentifier: "estahaCell", for: IndexPath)as? EstrahatcutomCell{
            return cell
       }else{
        return EstrahatcutomCell()
        }
    }

}
