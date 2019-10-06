//
//  dateVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/8/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import EzPopup

class DateForDyafaVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var fromDay: UITextField!
    @IBOutlet weak var toDay: UITextField!
    @IBOutlet weak var fromHour: UITextField!
    @IBOutlet weak var toHour: UITextField!
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showDatePicker(TF: fromDay,TypeOfPicker: datePicker)
        showDatePicker(TF: toDay, TypeOfPicker: datePicker)
        showDatePicker(TF: fromHour, TypeOfPicker: timePicker)
        showDatePicker(TF: toHour, TypeOfPicker: timePicker)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
        
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
            formatter.dateFormat = "dd/MM/yyyy"
            fromDay.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
            fromDay.resignFirstResponder()
        }
        if toDay.isFirstResponder{
            //datePicker.datePickerMode = .date
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            toDay.text = formatter.string(from: datePicker.date)
            self.view.endEditing(true)
            toDay.resignFirstResponder()
        }
        if fromHour.isFirstResponder{
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm"
            fromHour.text = formatter.string(from: timePicker.date)
            self.view.endEditing(true)
            fromHour.resignFirstResponder()
        }
        if toHour.isFirstResponder{
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm"
            toHour.text = formatter.string(from: timePicker.date)
            self.view.endEditing(true)
            toHour.resignFirstResponder()
        }
        self.view.endEditing(true)
    }
    
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    
    
}
