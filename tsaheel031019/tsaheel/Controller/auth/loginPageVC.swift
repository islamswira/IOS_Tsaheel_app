//
//  loginPageVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/25/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import BRYXBanner

class loginPageVC: UIViewController {

    @IBOutlet weak var phoneTXT: customTextField!
    @IBOutlet weak var passwordTXT: customTextField!
    @IBOutlet weak var checkBox: UIButton!
    @IBOutlet weak var remmeberMe: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
    }

   
    @IBAction func loginBTNPressed(_ sender: UIButton) {
        
        guard let phone = phoneTXT.text?.trimmed, !(phoneTXT.text?.isEmpty)! else { return }
        guard let password = passwordTXT.text, !(passwordTXT.text?.isEmpty)! else { return }

        api.login(phone: phone, password: password) { (error: Error?, success: Bool) in
            if success {
                // what happend ig loginin done
            }else {
                // what happend if login is not done 
            }
        }
    }
    
    
}







//
//    let defaults = UserDefaults.standard
//
//
//





//
//    struct keys {
//        static let statues = "Status"
//        static let userID = "userId"
//    }
//
//   @IBAction func loginTestFunc(){
//
//        guard let phone = phoneTXT.text, !(phoneTXT.text?.isEmpty)! else { return }
//        guard let password = passwordTXT.text, !(passwordTXT.text?.isEmpty)! else { return }
//
//
//        let urlLis = "http://test2.f4h.com.sa/tasahil/app/users/login"
//        let parameters: [String: Any] = [
//                "username": phone,
//                "password": password
//            ]
//
//        guard let url = URL(string: urlLis) else {return}
//        let request = NSMutableURLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = createBody(parameter: parameters)  /// make funcition
//
//        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
//
//            if let myError = error {
//                print(myError)
//                return
//
//            }
//
//            guard let myResponse = response as? HTTPURLResponse else {return}
//            print(myResponse)
//            guard let myData = data else {return}
//            print(myData)
//            do{
//                let decoder = JSONDecoder()
//                let networkResponse = try! decoder.decode(networkRes.self, from: myData)
//                print(networkResponse)
//                self.defaults.set(networkResponse.status, forKey: keys.statues)
//
//            }catch let err{
//                print(err)
//            }
//
//
//
//            }.resume()
//
//
//    }
//
//
//    func createBody (parameter : [String: Any])-> Data{
//
//        let params = NSMutableDictionary()
//
//            for (key, value) in parameter{
//                params.setValue(value, forKey: key)
//            }
//
//            let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
//
//            let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
//
//            return jsonString.data(using: .utf8)!
//
//        }
//
//
