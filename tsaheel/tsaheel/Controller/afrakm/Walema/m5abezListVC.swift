//
//  m5abezListVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/12/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class m5abezListVC: UIViewController  , UITableViewDataSource , UITableViewDelegate{

    @IBOutlet weak var m5abezTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        m5abezTableView.dataSource = self
        m5abezTableView.delegate = self
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