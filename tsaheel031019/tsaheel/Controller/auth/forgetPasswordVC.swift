//
//  forgetPasswordVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/22/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class forgetPasswordVC: UIViewController {

    @IBOutlet weak var phoneTF: customTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
      //  btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar

    }
    
    @IBAction func ForgetBtnPressed(_ sender: Any) {
        guard let phone = phoneTF.text?.trimmed, !(phoneTF.text?.isEmpty)! else { return }
        
        
        api.forgetPassword(phone: phone) { (error: Error?, success: Bool) in
            if success {
                // successs
            }else{
                
                // faild
            }
                
            
                
        }
        
    }
    
}








/*
//
//  Register.swift
//  E-Coomerce
//
//  Created by Khalil Albna on 5/8/19.
//  Copyright © 2019 Khalil Albna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import BRYXBanner

class Register: UIViewController {
    let locale = Locale.current
    
    @IBOutlet weak var txtphonenumber: UITextField!
    @IBOutlet weak var txtconfirmpassword: UITextField!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtadress: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    @IBOutlet weak var txtlastname: UITextField!
    @IBOutlet weak var txtfirstname: UITextField!
    @IBOutlet weak var txtname: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        print(locale.regionCode)
    }
    
    
    @IBAction func butsignup(_ sender: Any) { guard let emailre = txtemail.text, !emailre.isEmpty else {
        
        
        let banner = Banner(title: "من فضلك قم بادخال البريد الالكتروني", subtitle: "هناك مشلة في الاتصال", image: UIImage(named: "warning"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
        
        return
        
        }
        guard let passwre = txtpassword.text, !passwre.isEmpty else {
            let banner = Banner(title: "من فضلك قم بادخال كلمة المرور", subtitle: "هناك مشلة في الاتصال", image: UIImage(named: "warning"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
            
            
        }
        guard let confirm = txtconfirmpassword.text, !confirm.isEmpty else {
            
            let banner = Banner(title: "من فضلك قم بادخال كلمة المرور مرة أخرى", subtitle: "هناك مشكلة في الاتصال", image: UIImage(named: "warning"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
            
        }
        guard let usernamere = txtfirstname.text, !usernamere.isEmpty else {
            
            let banner = Banner(title: "من فضلك قم بادخال اسم المستخدم", subtitle: "هناك مشكلة في الاتصال", image: UIImage(named: "Alert"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
            
        }
        guard let l_name = txtlastname.text, !usernamere.isEmpty else {
            
            let banner = Banner(title: "من فضلك قم بادخال اسم المستخدم", subtitle: "هناك مشكلة في الاتصال", image: UIImage(named: "Alert"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
            
        }
        guard let phone = txtphonenumber.text, !phone.isEmpty else {
            
            let banner = Banner(title: "من فضلك قم بادخال اسم المستخدم", subtitle: "هناك مشكلة في الاتصال", image: UIImage(named: "Alert"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
            
        }
        guard let country = txtadress.text, !country.isEmpty else {
            
            let banner = Banner(title: "من فضلك قم بادخال اسم المستخدم", subtitle: "هناك مشكلة في الاتصال", image: UIImage(named: "Alert"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
            
        }
        let parameters = ["name": usernamere, "password": passwre, "password_confirmation":confirm, "email": emailre , "phone"
            : phone, "country" : country ]
        print(txtconfirmpassword.text ?? "")
        print(txtpassword.text ?? "")
        print(txtfirstname.text ?? "")
        print(txtemail.text ?? "")
        
        
        if txtconfirmpassword.text != txtpassword.text{
            
            let banner = Banner(title: "كلمة المرور يجب ان تكون متطابقة", subtitle: "هناك مشكلة في الاتصال", image: UIImage(named: "warning"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
            return
        }
        
        Alamofire.request("https://waffarnaa.com/public/api/register", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON {response in
                switch response.result{
                case .failure(let error) :
                    print(error)
                    let banner = Banner(title: "Error", subtitle: "Server Problem.", image: UIImage(named: "warning"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.show(duration: 3.0)
                    
                case .success(let value) : let json = JSON(value)
                let sucsess = Banner(title: "Rigesterd", subtitle: "Done", image: UIImage(named: "shield"), backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
                sucsess.dismissesOnTap = true
                sucsess.show(duration: 3.0)
                    
                    
                }
                
                /*
                 // MARK: - Navigation
                 
                 // In a storyboard-based application, you will often want to do a little preparation before navigation
                 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                 // Get the new view controller using segue.destination.
                 // Pass the selected object to the new view controller.
                 }
                 */
                
        }
        
    }
    
}
*/
/*
import UIKit
import Alamofire
import SwiftyJSON
import BRYXBanner

struct LoginModuel : Decodable {
    let success : LoginDetails?
}
struct LoginDetails : Decodable {
    let token : String?
    let id : Int?
}

class Login: UIViewController {
    
    @IBOutlet weak var butlogin: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        butlogin.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func butloginfunc(_ sender: Any) {
        guard let email = txtemail.text, !(txtemail.text?.isEmpty)! else { return }
        guard let password = txtpassword.text, !(txtpassword.text?.isEmpty)! else { return }
        
        
        let urlLis = "https://waffarnaa.com/public/api/login"
        
        let parameter: Parameters = [
            "email": email,
            "password": password
        ]
        
        
        Alamofire.request(urlLis, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let LoginDetails):
                    print("isi: \(LoginDetails)")
                    
                    let sucsess = Banner(title: "sucsess", subtitle: "Thanks", image: UIImage(named: "checked"), backgroundColor: UIColor(red:0/255.0, green:200/255.0, blue:0/255.0, alpha:1.000))
                    sucsess.dismissesOnTap = true
                    sucsess.show(duration: 3.0)
                    UserDefaults.standard.set(true, forKey: "USERLOGGEDIN")
                case .failure(var fail):
                    let banner = Banner(title: "Error", subtitle: "Server Problem.", image: UIImage(named: "warning"), backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.show(duration: 3.0)
                    
                }
                
        }
    }
}
*/
////
////  ViewController.swift
////  tsaheel
////
////  Created by Islam Swira on 8/19/19.
////  Copyright © 2019 com.Islam Swira. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import SwiftyJSON
//import BRYXBanner
//
//
//class loginVC: UIViewController {
//    @IBOutlet weak var mailTxt: customTextField!
//    @IBOutlet weak var passwordTxt: customTextField!
//    @IBOutlet weak var checkBox: UIButton!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let btnBar = UIBarButtonItem()
//        //btnBar.image = UIImage(named: "Phone")
//        btnBar.title = " "
//        self.navigationItem.backBarButtonItem = btnBar
//        
//        butloginfunc()
//        
//    }
//    
//    // validation of check box
//    private var checkbox_selected: Bool = true
//    
//    @IBAction func checkbox_selected(_ sender: Any){
//        if checkBox.isSelected {
//            checkBox.isSelected = false
//            checkbox_selected = false
//        }else {
//            checkBox.isSelected = true
//            checkbox_selected = true
//        }
//    }
//    
//    //    @IBAction func butloginfunc(_ sender: Any) {
//    //        guard let phone = mailTxt.text, !(mailTxt.text?.isEmpty)! else { return }
//    //        guard let password = passwordTxt.text, !(passwordTxt.text?.isEmpty)! else { return }
//    //
//    //
//    //        let urlLis = "http://test2.f4h.com.sa/tasahil/app/users/login"
//    //
//    //        let parameter: [String: Any] = [
//    //            "username": phone,
//    //            "password": password
//    //        ]
//    //
//    //
//    //        guard let url = URL(string: urlLis) else {return}
//    //        let request = NSMutableURLRequest(url: url)
//    //        request.httpMethod = "POST"
//    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    //        request.httpBody = createBody(parameters: parameter)
//    //
//    //
//    //        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
//    //
//    //            guard let myError = error else {return}
//    //            print(myError)
//    //
//    //            guard let myResponse = response as? HTTPURLResponse else {return}
//    //            print(myResponse)
//    //
//    //            guard let myData = data else {return}
//    //            print(myData)
//    //            do{
//    //                let networkResponse = try! JSONDecoder().decode(networkRes.self, from: myData)
//    //            }catch let err{
//    //                print(err)
//    //            }
//    //        }.resume()
//    //
//    //   }
//    
//    
//    func butloginfunc() {
//        guard let phone = mailTxt.text, !(mailTxt.text?.isEmpty)! else { return }
//        guard let password = passwordTxt.text, !(passwordTxt.text?.isEmpty)! else { return }
//        
//        
//        let urlLis = "http://test2.f4h.com.sa/tasahil/app/users/login"
//        
//        let parameter: [String: Any] = [
//            "username": "01006287379",
//            "password": "123456"
//        ]
//        
//        
//        guard let url = URL(string: urlLis) else {return}
//        let request = NSMutableURLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpBody = createBody(parameters: parameter)
//        
//        
//        let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
//            
//            guard let myError = error else {return}
//            print(myError)
//            
//            guard let myResponse = response as? HTTPURLResponse else {return}
//            print(myResponse)
//            
//            guard let myData = data else {return}
//            print(myData)
//            do{
//                let networkResponse = try! JSONDecoder().decode(networkRes.self, from: myData)
//            }catch let err{
//                print(err)
//            }
//            }.resume()
//        
//    }
//    
//    func createBody(parameters: [String: Any]) -> Data{
//        
//        let params = NSMutableDictionary()
//        
//        for (key, value) in parameters{
//            params.setValue(value, forKey: key)
//        }
//        
//        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
//        
//        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
//        
//        return jsonString.data(using: .utf8)!
//        
//    }
//    
//}
////
////
//// Alamofire.request(urlLis, method: .post, parameters: parameter, encoding: URLEncoding.default, headers: nil)
//// .validate(statusCode: 200..<300)
//// .responseJSON { response in
////
////
//// switch response.result {
//// case .success:
//// let sucsess = Banner(title: "sucsess", subtitle: "Thanks", backgroundColor: UIColor(red:0/255.0, green:200/255.0, blue:0/255.0, alpha:1.000))
//// sucsess.dismissesOnTap = true
//// sucsess.show(duration: 3.0)
//// UserDefaults.standard.set(true, forKey: "USERLOGGEDIN")
////
////
////
//// case .failure(var fail):
//// print(fail.localizedDescription)
//// let banner = Banner(title: "Error", subtitle: "Server Problem.", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
//// banner.dismissesOnTap = true
//// banner.show(duration: 3.0)
////
//// }
////
//// }
////
//
//
//
//
//
////
////    func createBody(parameters: [String: Any]) -> Data{
////
////        let params = NSMutableDictionary()
////
////        for (key, value) in parameters{
////            params.setValue(value, forKey: key)
////        }
////
////        let jsonData = try! JSONSerialization.data(withJSONObject: params, options: [])
////
////        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
////
////        return jsonString.data(using: .utf8)!
////
////}
////
//
//
//
//
//
////
//
////    guard let url = URL(string: urlLis) else {return}
////
////    let request = NSMutableURLRequest(url: url)
////    request.httpMethod = "POST"
////    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////    request.httpBody = createBody(parameters: parameter)
////
////    let session = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
////
////        if let error = error{
////            print(error.localizedDescription)
////            return
////        }
////
////        guard let response  = response as? HTTPURLResponse else{
////            return
////        }
////
////        guard let data = data else {return}
////
////        print("safe data")
////        do{
////            let decoder = JSONDecoder()
////            //decoder.keyDecodingStrategy = .convertFromSnakeCase
////            let networkResponse  = try decoder.decode(networkRes.self, from: data)
////            print(networkResponse)
////        }
////        catch let err{
////            print(err)
////        }
////
////        }.resume()
