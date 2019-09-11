//
//  EstahatVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/8/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class EstahatVC: UIViewController, UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var estrahatTablwView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
        //  btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar

        
        
        // Do any additional setup after loading the view.
    }
    

}
