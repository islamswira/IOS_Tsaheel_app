//
//  companyOwnerSignUpVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class companyOwnerSignUpVC: UIViewController {
    
    @IBOutlet weak var fullnameTXT: customTextField!
    @IBOutlet weak var mailTXT: customTextField!
    @IBOutlet weak var passwordTXT: customTextField!
    @IBOutlet weak var phoneTXT: customTextField!
    @IBOutlet weak var idNumberTXT: customTextField!
    @IBOutlet weak var companyNameTXT: customTextField!
    @IBOutlet weak var activityTypeTXT: customTextField!
    
    @IBOutlet weak var companyPhoneTXT: customTextField!
    @IBOutlet weak var companyTelefoneTXT: customTextField!
    @IBOutlet weak var cityTXT: customTextField!
    @IBOutlet weak var naighboorTXT: customTextField!
    @IBOutlet weak var streetAddressTXT: customTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
       // btnBar.image = UIImage(named: "Phone")
        title = ""
        self.navigationItem.backBarButtonItem = btnBar

    }
    
    @IBAction func registerBtnPressed(_ sender: Any) {
        guard let fullName = fullnameTXT.text?.trimmed, !(fullnameTXT.text?.isEmpty)! else { return }
        guard let mail = mailTXT.text?.trimmed, !(mailTXT.text?.isEmpty)! else { return }
        guard let password = passwordTXT.text, !(passwordTXT.text?.isEmpty)! else { return }
        guard let phone = phoneTXT.text, !(phoneTXT.text?.isEmpty)! else { return }
        guard let idNumber = idNumberTXT.text?.trimmed, !(idNumberTXT.text?.isEmpty)! else { return }
        guard let companyName = companyNameTXT.text?.trimmed, !(companyNameTXT.text?.isEmpty)! else { return }
        guard let ActivityType = activityTypeTXT.text?.trimmed, !(activityTypeTXT.text?.isEmpty)! else { return }
        guard let companyPhone = companyPhoneTXT.text?.trimmed, !(companyPhoneTXT.text?.isEmpty)! else { return }
        guard let companyTelefone = companyTelefoneTXT.text?.trimmed, !(companyTelefoneTXT.text?.isEmpty)! else { return }
        guard let city = cityTXT.text?.trimmed, !(cityTXT.text?.isEmpty)! else { return }
        guard let naighboor = naighboorTXT.text?.trimmed, !(naighboorTXT.text?.isEmpty)! else { return }
        guard let streetAddress = streetAddressTXT.text?.trimmed, !(streetAddressTXT.text?.isEmpty)! else { return }
        
        api.registerForCompanyOwner(id: nil, name: fullName, phone: phone, mail: mail, password: password, nationalID: idNumber, compName: companyName, compType: ActivityType, compTele: companyTelefone, compPhone: companyPhone, compCity: city, compState: naighboor, compStreet: streetAddress) { (registerDataModel, error) in
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
    
    @IBAction func backButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
