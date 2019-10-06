//
//  KwshWTawlatListVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/13/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class KwshWTawlatListVC: UIViewController, UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var KwshWTawlatMrakezTB: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KwshWTawlatMrakezTB.dataSource = self
        KwshWTawlatMrakezTB.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "kwshWTawlatCustomCell", for: indexPath)as? mrakzCustomCell{
            return cell
        }else{
            return mrakzCustomCell()
        }
    }
}
