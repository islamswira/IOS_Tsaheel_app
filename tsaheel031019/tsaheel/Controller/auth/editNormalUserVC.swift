//
//  editNormalUserVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/27/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class editNormalUserVC: UIViewController {

    @IBOutlet weak var nameTF: customTextField!
    @IBOutlet weak var phoneTF: customTextField!
    @IBOutlet weak var mailTF: customTextField!
    @IBOutlet weak var passwordTF: customTextField!
    @IBOutlet weak var addressTF: customTextField!
    var memStatue = ""
    var userID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        title = ""
        self.navigationItem.backBarButtonItem = btnBar

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveChangesBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
