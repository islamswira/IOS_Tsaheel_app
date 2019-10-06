//
//  dateVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/8/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import EzPopup
import BRYXBanner
import iOSDropDown
class dateVC: UIViewController, UITextFieldDelegate {
  
    @IBOutlet weak var fromDay: UITextField!
    @IBOutlet weak var toDay: UITextField!
    @IBOutlet weak var fromHour: UITextField!
    @IBOutlet weak var toHour: UITextField!
    
    @IBOutlet weak var chooseCityTF: DropDown!
    
    @IBOutlet weak var SearchButton: customButton!
    var estrahatARR : [EstrahaData] = [EstrahaData]()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    let cityPicker = UIPickerView()
    
    var pickerdata: [String] = [String]()
    
    let defaults = UserDefaults.standard
    var dateTimeDic = [String:String]()
    var fromDayisSelected = false{
        didSet{
            checkerforempty()
        }
    }
    var toDayisSelected = false{
        didSet{
            checkerforempty()
        }
    }
    var fromHourisSelected = false{
        didSet{
            checkerforempty()
        }
    }
    var toHourisSelected = false{
        didSet{
            checkerforempty()
        }
    }
    var CityisSelected = false{
        didSet{
            checkerforempty()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDatePicker(TF: fromDay,TypeOfPicker: datePicker)
        showDatePicker(TF: toDay, TypeOfPicker: datePicker)
        showDatePicker(TF: fromHour, TypeOfPicker: timePicker)
        showDatePicker(TF: toHour, TypeOfPicker: timePicker)
        
        chooseCityTF.optionArray = ["الدمام","جدة","الرياض"]
        chooseCityTF.didSelect { (selectedText, index, id) in
            self.chooseCityTF.text = "\(selectedText)"
            self.CityisSelected = true
        }
        fromDay.delegate = self
        toDay.delegate = self
        fromHour.delegate = self
        toHour.delegate = self
        chooseCityTF.delegate = self
        SearchButton.isEnabled = false
        SearchButton.alpha = 0.5
        
        AddButtonHandler()
    }

    func AddButtonHandler(){

        fromDay.addTarget(self, action: #selector(self.checkerforempty), for: .editingChanged)
        toDay.addTarget(self, action: #selector(self.checkerforempty), for: .editingChanged)
        fromHour.addTarget(self, action: #selector(self.checkerforempty), for: .editingChanged)
        toHour.addTarget(self, action: #selector(self.checkerforempty), for: .editingChanged)
        chooseCityTF.addTarget(self, action: #selector(self.checkerforempty), for: .editingChanged)
    }
    @objc func checkerforempty(){
        guard  fromDayisSelected == true, toDayisSelected == true, fromHourisSelected == true, toHourisSelected == true, CityisSelected == true else{
            SearchButton.isEnabled = false
            SearchButton.alpha = 0.5
            print("Button Is not working")
            return
        }
        print("Button Is working")
        SearchButton.isEnabled = true
        SearchButton.alpha = 1

    }
    
    
    
    
    
    func showDatePicker(TF: UITextField, TypeOfPicker: UIDatePicker){
        //Formate Date
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
        let loc = Locale(identifier: "ar")
        self.datePicker.locale = loc
        self.timePicker.locale = loc
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        let Datetitle = TF
        Datetitle.inputAccessoryView = toolbar
        Datetitle.inputView = TypeOfPicker
        
    }
    @objc func donedatePicker(){
        if fromDay.isFirstResponder{
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            fromDay.text = formatter.string(from: datePicker.date)
            dateTimeDic["fromDay"] = fromDay.text
            self.view.endEditing(true)
            fromDayisSelected = true
            fromDay.resignFirstResponder()
            print("fromDay \(fromDay.text!)")
        }
        if toDay.isFirstResponder{
            //datePicker.datePickerMode = .date
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            toDay.text = formatter.string(from: datePicker.date)
            dateTimeDic["toDay"] = toDay.text
            self.view.endEditing(true)
            toDayisSelected = true
            toDay.resignFirstResponder()
            print("toDay \(toDay.text!)")
        }
        if fromHour.isFirstResponder{
            let formatter = DateFormatter()
            //TO CHECK if the local system of iphone is 24 or 12
            let locale = NSLocale.current
            let localFormatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
            if localFormatter.contains("a") {
                //phone is set to 12 hours
                formatter.dateFormat = "hh:mm a"
            } else {
                //phone is set to 24 hours
                formatter.dateFormat = "hh:mm a"
            }
            
            fromHour.text = formatter.string(from: timePicker.date)
            dateTimeDic["fromHour"] = fromHour.text
            self.view.endEditing(true)
            fromHourisSelected = true
            fromHour.resignFirstResponder()
            print("fromHour \(fromHour.text!)")
        }
        if toHour.isFirstResponder{
            let formatter = DateFormatter()
            //TO CHECK if the local system of iphone is 24 or 12
            let locale = NSLocale.current
            let localFormatter : String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
            if localFormatter.contains("a") {
                //phone is set to 12 hours
                formatter.dateFormat = "hh:mm a"
            } else {
                //phone is set to 24 hours
                formatter.dateFormat = "hh:mm a"
            }
            toHour.text = formatter.string(from: timePicker.date)
            dateTimeDic["toHour"] = toHour.text
            self.view.endEditing(true)
            toHourisSelected = true
            toHour.resignFirstResponder()
            print("toHour \(toHour.text!)")
        }
        self.view.endEditing(true)
    }
    
    
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
    
    func showCityPicker (TF:UITextField , picker: UIPickerView ){
        
        //ToolBar
//        let toolbar = UIToolbar();
//        toolbar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneCityPicker));
//        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
//        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelCityPicker));
//
//        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        let pickerTitle = TF
//        pickerTitle.inputAccessoryView = toolbar
        pickerTitle.inputView = picker
        
    }
    
    @objc func doneCityPicker(){
        
      //  chooseCityTF.resignFirstResponder()
         self.view.endEditing(true)
    }
    
    @objc func cancelCityPicker(){
        self.view.endEditing(true)
    }
    
    
 
    
    
    // pickerview functions here
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerdata.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerdata[row]
//    }
//
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        chooseCityTF.text! = pickerdata[row]
//    }
    
    
    let sucsess = Banner(title: "إنتظر", subtitle: "جاري تحميل البيانات", backgroundColor: UIColor(red:0/255.0, green:155/255.0, blue:100/255.0, alpha:1.000))
    @IBAction func serachButtonPressed(_ sender: Any) {
        self.sucsess.show()
        defaults.set(dateTimeDic, forKey: "dateTimeDic")
         let city = "الرياض"

        api.getAvilableEstrahaBasedOntimeAnddate(city: city, dateIn: fromDay.text!, dateOut: toDay.text!, timeIn: fromHour.text!, timeOut: toHour.text!) { (Estrahat, err) in
            
            if err != nil{
                print("error ! = nil \(err?.localizedDescription)")
            }
            
            
            let estrahat = Estrahat?.data
            //print("estrahat \(estrahat)")
            self.estrahatARR = estrahat ?? []
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EstrahatListVC") as? EstrahatListVC
            vc?.estrahatARR = estrahat!
            self.navigationController?.pushViewController(vc!, animated: true)
            //sucsess.dismiss()
            
        }

        
        
        
//        performSegue(withIdentifier: "GoToEstrahaList", sender: self)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        sucsess.dismiss()
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let VC = segue.destination as! EstrahatListVC
//        VC.estrahatARR = self.estrahatARR
//        //print(VC.estrahatARR)
//    }
    
}
