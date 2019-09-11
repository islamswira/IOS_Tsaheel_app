//
//  editCompanyUser.swift
//  tsaheel
//
//  Created by Islam Swira on 8/27/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class editCompanyUser: UIViewController {
    @IBOutlet weak var nameTF: customTextField!
    @IBOutlet weak var phoneTF: customTextField!
    @IBOutlet weak var mailTF: customTextField!
    @IBOutlet weak var passwordTF: customTextField!
    @IBOutlet weak var idNumberTF: customTextField!
    @IBOutlet weak var companyNameTF: customTextField!
    @IBOutlet weak var activityTypeTF: customTextField!
    @IBOutlet weak var companyPhoneTF: customTextField!
    @IBOutlet weak var companyTelefoneTF: customTextField!
    @IBOutlet weak var cityTF: customTextField!
    @IBOutlet weak var naighboorTF: customTextField!
    @IBOutlet weak var streetAddressTF: customTextField!
    
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
        guard let fullName = nameTF.text?.trimmed, !(nameTF.text?.isEmpty)! else { return }
        guard let mail = mailTF.text?.trimmed, !(mailTF.text?.isEmpty)! else { return }
        guard let password = passwordTF.text, !(passwordTF.text?.isEmpty)! else { return }
        guard let phone = phoneTF.text, !(phoneTF.text?.isEmpty)! else { return }
        guard let idNumber = idNumberTF.text?.trimmed, !(idNumberTF.text?.isEmpty)! else { return }
        guard let companyName = companyNameTF.text?.trimmed, !(companyNameTF.text?.isEmpty)! else { return }
        guard let ActivityType = activityTypeTF.text?.trimmed, !(activityTypeTF.text?.isEmpty)! else { return }
        guard let companyPhone = companyPhoneTF.text?.trimmed, !(companyPhoneTF.text?.isEmpty)! else { return }
        guard let companyTelefone = companyTelefoneTF.text?.trimmed, !(companyTelefoneTF.text?.isEmpty)! else { return }
        guard let city = cityTF.text?.trimmed, !(cityTF.text?.isEmpty)! else { return }
        guard let naighboor = naighboorTF.text?.trimmed, !(naighboorTF.text?.isEmpty)! else { return }
        guard let streetAddress = streetAddressTF.text?.trimmed, !(streetAddressTF.text?.isEmpty)! else { return }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
