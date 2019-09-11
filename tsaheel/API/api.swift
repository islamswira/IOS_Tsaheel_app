//
//  api.swift
//  tsaheel
//
//  Created by Islam Swira on 8/26/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import BRYXBanner

class api: NSObject {

    /// ligin func start here !!
    class func login(phone:String , password:String , completion: @escaping (_ error:Error? , _ success:Bool)->Void){
        
        
        let url = "http://test2.f4h.com.sa/tasahil/app/users/login"
        
        let parameter = [
            "username": phone,
            "password": password
        ]
        let headers = [
            "KEY": "Content-Type",
            "VALUE": "application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let err):
                    completion(err , false)
                    print(err)
                    let banner = Banner(title: "خطأ", subtitle: "مشكلة في الخادم ، حاول مرة اخرى !!", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.show(duration: 3.0)
                    
                case .success(let value):
                    //Banner
                    let sucsess = Banner(title: "تسجسل الدخول", subtitle: "تم تسجيل الدخول بنجاح ، مرحبا", backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
                    sucsess.dismissesOnTap = true
                    sucsess.show(duration: 3.0)
                    
                    //JSON
                    let json = JSON(value)
                    print(json)
                    
                    if let userID = json["data"][0]["id"].string {
                        print("userID \(userID)")
                        
                        //save ID to user default
                        helper.saveIDToUserDefault(id: userID)

                        completion(nil, true)
                    }else {
                        print("can not access")
                    }
                    if let mem_statue = json["data"][0]["mem_status"].string{
                        print("mem_statue is \(mem_statue)")
                        helper.saveMemStatueToUserDefault(memStatue: mem_statue)
                        completion(nil, true)
                    }
                    
                }
        }
    }
    
    
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // register for normal user  func start here
    
    class func registerForNormalUser(id: String?, name:String , phone:String ,mail:String, password:String ,address:String, completion: @escaping (RegisterDataModel?, Error?)->Void){
        
        var parameter: [String: String]!
        let url = "http://test2.f4h.com.sa/tasahil/app/users/reg_client"
        if id ==  nil {
            parameter = [
                "fname": name,
                "phone":phone,
                "email": mail,
                "password": password,
                "address": address
            ]
        } else {
            parameter = [
                "member_id": id,
                "fname": name,
                "phone":phone,
                "email": mail,
                "password": password,
                "address": address
                ] as! [String : String]
        }
    
        
        let headers = [
            "KEY": "Content-Type",
            "VALUE": "application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                do {
                    guard let data = response.data else { return }
                    let registerDataModel = try JSONDecoder().decode(RegisterDataModel.self, from: data)
                    completion(registerDataModel, nil)
                    
                } catch let jsonError {
                    print(jsonError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
//        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//
//                switch response.result
//                {
//                case .failure(let err):
//                    completion(err , false)
//                    print(err)
//                    //Banner
//                    let banner = Banner(title: "خطأ", subtitle: "مشكلة في الخادم ، حاول مرة اخرى !!", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
//                    banner.dismissesOnTap = true
//                    banner.show(duration: 3.0)
//
//                case .success(let value):
//                    //Banner
//                    let sucsess = Banner(title: "انشاء حساب عميل عادي", subtitle: "تم انشاد الحساب بنجاح ، مرحبا", backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
//                    sucsess.dismissesOnTap = true
//                    sucsess.show(duration: 3.0)
//                    //JSON
//                    let json = JSON(value)
//                    print(json)
//
//                    if let userID = json["data"][0]["id"].string {
//                        print(userID)
//
//                        //save ID to user default
//                        helper.saveIDToUserDefault(id: userID)
//
//
//                        completion(nil, true)
//                    }else {
//                        print("can not access")
//                    }
//
//
//                }
//        }
    }
    
    
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // register for company owner user  func start here
    
    
    class func registerForCompanyOwner(id: String?,name:String , phone:String ,mail:String, password:String  ,nationalID:String,compName:String,compType:String,compTele:String,compPhone:String,compCity:String,compState:String,compStreet:String, completion: @escaping (RegisterDataModel?, Error?)->Void){
        
        var parameter: [String: String]!
        let url = "http://test2.f4h.com.sa/tasahil/app/users/reg_company"
        if id  == nil{
            parameter = [
                "fname": name,
                "phone":phone,
                "email": mail,
                "password": password,
                "national_id": nationalID,
                "comp_name": compName,
                "comp_type": compType,
                "comp_tele": compTele,
                "comp_phone": compPhone,
                "comp_city": compCity,
                "comp_state": compState,
                "comp_street": compStreet
                ] as! [String : String]
        }else {
            parameter = [
                "member_id": id,
                "fname": name,
                "phone":phone,
                "email": mail,
                "password": password,
                "national_id": nationalID,
                "comp_name": compName,
                "comp_type": compType,
                "comp_tele": compTele,
                "comp_phone": compPhone,
                "comp_city": compCity,
                "comp_state": compState,
                "comp_street": compStreet
                ] as! [String : String]
        }
        
        
        let headers = [
            "KEY": "Content-Type",
            "VALUE": "application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                do {
                    guard let data = response.data else { return }
                    let registerDataModel = try JSONDecoder().decode(RegisterDataModel.self, from: data)
                    completion(registerDataModel, nil)
                } catch let jsonError {
                    print(jsonError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
//        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//
//                switch response.result
//                {
//                case .failure(let err):
//                    completion(err , false)
//                    print(err)
//                    //Banner
//                    let banner = Banner(title: "خطأ", subtitle: "مشكلة في الخادم ، حاول مرة اخرى !!", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
//                    banner.dismissesOnTap = true
//                    banner.show(duration: 3.0)
//
//                case .success(let value):
//                    //Banner
//                    let sucsess = Banner(title: "انشاء حساب عميل عادي", subtitle: "تم انشاد الحساب بنجاح ، مرحبا", backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
//                    sucsess.dismissesOnTap = true
//                    sucsess.show(duration: 3.0)
//                    //JSON
//                    let json = JSON(value)
//                    print(json)
//
//                    if let userID = json["data"][0]["id"].string {
//                        print(userID)
//
//                        //save ID to user default
//                        helper.saveIDToUserDefault(id: userID)
//
//
//                        completion(nil, true)
//                    }else {
//                        print("can not access")
//                    }
//
//
//                }
//        }
    }
    
    
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // register for dilivary User   func start here
    
    class func registerFordelivaryUser(id: String?,name:String , phone:String ,mail:String, password:String ,carType:String,carModel: String ,carNum:String ,nationalPhoto:String,carPhoto:String , completion: @escaping (RegisterDataModel?, Error?)->Void){
        
        var parameter: [String: String]!
        let url = "http://test2.f4h.com.sa/tasahil/app/users/reg_delivery"
        if id == nil{
            parameter = [
                "fname":name,
                "phone":phone,
                "email":mail,
                "password":password,
                "car_type":carType,
                "car_model":carModel,
                "car_num":carNum,
                "nationalphoyo":nationalPhoto,
                "carphoto":carPhoto
                
                ] as! [String : String]
        }else {
            parameter = [
                "member_id": id,
                "fname":name,
                "phone":phone,
                "email":mail,
                "password":password,
                "car_type":carType,
                "car_model":carModel,
                "car_num":carNum,
                "nationalphoyo":nationalPhoto,
                "carphoto":carPhoto
                
                ] as! [String : String]
        }
        
        
        let headers = [
            "KEY": "Content-Type",
            "VALUE": "application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                do {
                    guard let data = response.data else { return }
                    let registerDataModel = try JSONDecoder().decode(RegisterDataModel.self, from: data)
                    completion(registerDataModel, nil)
                } catch let jsonError {
                    print(jsonError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
//        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers)
//            .responseJSON { response in
//
//                switch response.result
//                {
//                case .failure(let err):
//                    completion(err , false)
//                    print(err)
//                    //Banner
//                    let banner = Banner(title: "خطأ", subtitle: "مشكلة في الخادم ، حاول مرة اخرى !!", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
//                    banner.dismissesOnTap = true
//                    banner.show(duration: 3.0)
//
//                case .success(let value):
//                    //Banner
//                    let sucsess = Banner(title: "انشاء حساب عميل عادي", subtitle: "تم انشاد الحساب بنجاح ، مرحبا", backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
//                    sucsess.dismissesOnTap = true
//                    sucsess.show(duration: 3.0)
//                    //JSON
//                    let json = JSON(value)
//                    print(json)
//
//                    if let userID = json["data"][0]["id"].string {
//                        print(userID)
//
//                        //save ID to user default
//                        helper.saveIDToUserDefault(id: userID)
//
//
//                        completion(nil, true)
//                    }else {
//                        print("can not access")
//                    }
//
//
//                }
//        }
    }
    
    
    /// forget Password func start here !!
    class func forgetPassword(phone:String , completion: @escaping (_ error:Error? , _ success:Bool)->Void){
        
        
        let url = "http://test2.f4h.com.sa/tasahil/app/users/forgetpass"
        
        let parameter = [
            "phone":phone
        ]
        let headers = [
            "KEY": "Content-Type",
            "VALUE": "application/json"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let err):
                    completion(err , false)
                    print(err)
                    let banner = Banner(title: "خطأ", subtitle: err.localizedDescription, backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
                    banner.dismissesOnTap = true
                    banner.show(duration: 3.0)
                    
                case .success(let value):
                    //JSON
                    let json = JSON(value)
                    print(json)
                    
                    if let ar_msg = json["ar_msg"].string {
                        if ar_msg == "رقم الهاتف غير موجود" {
                            let sucsess = Banner(title: "استرجاع كلمة المرور", subtitle: ar_msg, backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
                        sucsess.dismissesOnTap = true
                        sucsess.show(duration: 3.0)
                            
                          //  helper.restartApp()
                            
                        }else {
                            let sucsess = Banner(title: "استرجاع كلمة المرور", subtitle: ar_msg, backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
                            sucsess.dismissesOnTap = true
                            sucsess.show(duration: 3.0)
                            //helper.restartApp()
                        }
                        
                        
                        completion(nil, true)
                    }else {
                        print("can not access")
                    }
                    
                    
                }
        }
    }
}
