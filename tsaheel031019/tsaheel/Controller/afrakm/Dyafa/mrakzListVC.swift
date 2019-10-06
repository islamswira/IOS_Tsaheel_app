//
//  mrakzListVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/13/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class mrakzListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mrakzTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mrakzTableView.dequeueReusableCell(withIdentifier: "mrakzCell", for: indexPath)as? mrakzCustomCell {
            return cell
        }else{
            return mrakzCustomCell()
        }
    }

}
