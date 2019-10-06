//
//  kwshShapesVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/13/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class kwshShapesVC: UIViewController ,UITableViewDataSource,UITableViewDelegate{

    

    @IBOutlet weak var KwshTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KwshTableView.dataSource = self
        KwshTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "kwshCustomCell", for: indexPath)as? kwshWTawlatCustomCell{
            return cell
        }else{
            return kwshWTawlatCustomCell()
        }
    }
}
