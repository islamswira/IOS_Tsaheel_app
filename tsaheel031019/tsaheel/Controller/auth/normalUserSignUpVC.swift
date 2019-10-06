//
//  normalUserSignUpVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class normalUserSignUpVC: UIViewController {

    @IBOutlet weak var fullnameTXT: customTextField!
    @IBOutlet weak var mailTXT: customTextField!
    @IBOutlet weak var passwordTXT: customTextField!
    @IBOutlet weak var addressTXT: customTextField!
    @IBOutlet weak var phoneTXT: customTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
       // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        
        
    }

    
    @IBAction func registerBtnPressed(_ sender: Any) {
        
        guard let fullName = fullnameTXT.text?.trimmed, !(fullnameTXT.text?.isEmpty)! else { return }
        guard let mail = mailTXT.text?.trimmed, !(mailTXT.text?.isEmpty)! else { return }
        guard let password = passwordTXT.text, !(passwordTXT.text?.isEmpty)! else { return }
        guard let address = addressTXT.text?.trimmed, !(addressTXT.text?.isEmpty)! else { return }
        guard let phone = phoneTXT.text?.trimmed, !(phoneTXT.text?.isEmpty)! else { return }
        
        
        api.registerForNormalUser(id: nil, name: fullName, phone: phone, mail: mail, password: password, address: address) { (registerDataModel, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let registerDataModel = registerDataModel else { return }
                print(registerDataModel.msg)
                
                if let userID = registerDataModel.data?.first?.id {
                    helper.saveIDToUserDefault(id: userID)
                }
                if let memStatue = registerDataModel.data?.first?.mem_status{
                    helper.saveMemStatueToUserDefault(memStatue: memStatue)
                }
                
            }
        }
        
    }
    
}
