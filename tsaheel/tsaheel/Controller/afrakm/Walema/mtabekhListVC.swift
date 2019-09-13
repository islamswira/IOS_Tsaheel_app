//
//  mtabekhListVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/11/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class mtabekhListVC: UIViewController ,UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var mtabekhListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        
        mtabekhListTableView.dataSource = self
        mtabekhListTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "mtabekhCell", for: IndexPath)as? WalemaCutomCell {
            return cell
        }else{
            return WalemaCutomCell()
        }
    }
  

}
