//
//  editDelivaryUserVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/27/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class editDelivaryUserVC: UIViewController {
    @IBOutlet weak var nameTF: customTextField!
    @IBOutlet weak var phoneTF: customTextField!
    @IBOutlet weak var mailTF: customTextField!
    @IBOutlet weak var passwordTF: customTextField!
    @IBOutlet weak var carTypeTF: customTextField!
    @IBOutlet weak var carModelTF: customTextField!
    @IBOutlet weak var plateNumberTF: customTextField!
    
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
    
    @IBAction func idPhotoBtnPressed(_ sender: Any) {
    }
    @IBAction func carIDphotoBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
