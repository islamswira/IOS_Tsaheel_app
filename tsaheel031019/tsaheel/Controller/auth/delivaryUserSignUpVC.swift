//
//  delivaryUserSignUpVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import Alamofire

class delivaryUserSignUpVC: UIViewController {
    
    var IDPhotoImg : UIImage!
    var carIDPhoto : UIImage!
    @IBOutlet weak var fullnameTXT: customTextField!
    @IBOutlet weak var mailTXT: customTextField!
    @IBOutlet weak var passwordTXT: customTextField!
    @IBOutlet weak var phoneTXT: customTextField!
    @IBOutlet weak var carTypeTXT: customTextField!
    @IBOutlet weak var carModelTXT: customTextField!
    @IBOutlet weak var plateNumberTXT: customTextField!
    @IBOutlet weak var IdPhotoImage: customButton!
    @IBOutlet weak var carIdPhotoImage: customButton!
   
    
    var isCarImage = false
    var isIDImage = false
    var imagePicker: ImagePicker!
    var IDImageName = ""
    var CarImageName = ""
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
        //btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
       
    }
    // MARK : IDPhotoBtn
    @IBAction func IDPhotoBtn(_ sender: Any) {
        isCarImage = false
        isIDImage = true
        self.imagePicker.present(from: sender as! UIView)
    }
    
    
    // MARK : CarIDPhotoBtn
    @IBAction func carIDPhotoBtn(_ sender: Any) {
        isCarImage = true
        isIDImage = false
        self.imagePicker.present(from: sender as! UIView)
    }
    
    
    
    
    //register Btn Start here
    @IBAction func RegidterBtnPressed(_ sender: Any) {
        guard let fullName = fullnameTXT.text?.trimmed, !(fullnameTXT.text?.isEmpty)! else { return }
        guard let mail = mailTXT.text?.trimmed, !(mailTXT.text?.isEmpty)! else { return }
        guard let password = passwordTXT.text, !(passwordTXT.text?.isEmpty)! else { return }
        guard let phone = phoneTXT.text, !(phoneTXT.text?.isEmpty)! else { return }
        guard let carType = carTypeTXT.text?.trimmed, !(carTypeTXT.text?.isEmpty)! else { return }
        guard let carModel = carModelTXT.text?.trimmed, !(carModelTXT.text?.isEmpty)! else { return }
        guard let plateNumber = plateNumberTXT.text?.trimmed, !(plateNumberTXT.text?.isEmpty)! else { return }
        
        api.registerFordelivaryUser(id: nil, name: fullName, phone: phone, mail: mail, password: password, carType: carType, carModel: carModel, carNum: plateNumber, nationalPhoto: IDImageName, carPhoto: CarImageName) { (registerDataModel, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let registerDataModel = registerDataModel else { return }
                    print(registerDataModel.msg)
                    
                    if let userID = registerDataModel.data?.first?.id {
                        helper.saveIDToUserDefault(id: userID)
                    }
                    if let memStatue = registerDataModel.data?.first?.mem_status{
                        
                        print("mem_statue is  \(memStatue)")
                        helper.saveMemStatueToUserDefault(memStatue: memStatue)
                        
                    }else{
                        return
                    }
                    
                }
            }
        }
        

}



//MARK : Extension of imagePicker
extension delivaryUserSignUpVC: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        if isIDImage && !isCarImage {
            self.IDPhotoImg = image
            
            // we will start upload ID photo here ...
            let url = "http://test2.f4h.com.sa/tasahil/app/users/test_upload_photo2" /* your API url */
            let imagedata = self.IDPhotoImg?.jpegData(compressionQuality: 0.9)
            let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data"
            ]
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                if let data = imagedata{
                    multipartFormData.append(data, withName: "imgfile", fileName: "file.jpg", mimeType: "image/jpg")
                }
                
            }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
                switch result{
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let err = response.error{
                            print(err)
                            
                            //                        print("Succesfully uploaded")
                            
                            return
                        }else {
                            do {
                                guard let data = response.data else { return }
                                let uploadImageModel = try JSONDecoder().decode(UploadImageModel.self, from: data)
                                if let imgfile = uploadImageModel.data?.first?.imgfile{
                                    print(imgfile)
                                    self.IDImageName = imgfile
                                }
                                //                                completion(uploadImageModel, nil)
                            } catch let jsonError {
                                print(jsonError)
                            }
                        }
                        
                        //                        onCompletion?(nil)
                    }
                    
                case .failure(let error):
                    print("Error in upload: \(error.localizedDescription)")
                    //                    onError?(error)
                }
            }
            
        }else if isCarImage && !isIDImage{
            self.carIDPhoto = image
            
            // we will start Upload Car Photo here ...
            let url = "http://test2.f4h.com.sa/tasahil/app/users/test_upload_photo2" /* your API url */
            let imagedata = self.carIDPhoto?.jpegData(compressionQuality: 0.9)
            let headers: HTTPHeaders = [
                /* "Authorization": "your_access_token",  in case you need authorization header */
                "Content-type": "multipart/form-data"
            ]
            
            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                if let data = imagedata{
                    multipartFormData.append(data, withName: "imgfile", fileName: "file.jpg", mimeType: "image/jpg")
                }
                
            }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
                switch result{
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let err = response.error{
                            print(err)
                            
                            //                        print("Succesfully uploaded")
                            
                            return
                        }else {
                            do {
                                guard let data = response.data else { return }
                                let uploadImageModel = try JSONDecoder().decode(UploadImageModel.self, from: data)
                                if let imgfile = uploadImageModel.data?.first?.imgfile{
                                    print(imgfile)
                                    self.CarImageName = imgfile
                                }
                                //                                completion(uploadImageModel, nil)
                            } catch let jsonError {
                                print(jsonError)
                            }
                        }
                        
                        //                        onCompletion?(nil)
                    }
                    
                case .failure(let error):
                    print("Error in upload: \(error.localizedDescription)")
                    //                    onError?(error)
                }
            }
        }
        
    }
}

