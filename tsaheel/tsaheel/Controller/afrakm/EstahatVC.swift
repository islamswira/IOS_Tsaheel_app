//
//  EstahatVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/8/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class EstahatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var estrahatTablwView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        estrahatTablwView.dataSource = self
        estrahatTablwView.delegate = self

        // Do any additional setup after loading the view.
    }
    

}
