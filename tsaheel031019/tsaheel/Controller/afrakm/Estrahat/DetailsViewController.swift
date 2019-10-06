//
//  DetailsViewController.swift
//  tsaheel
//
//  Created by Mohamed Elsayed on 9/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.


import UIKit

class DetailsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
   
    

    @IBOutlet weak var cityLbl: UILabel!                                        //done
    @IBOutlet weak var adressLbl: UILabel!                                  //done
    @IBOutlet weak var numberOfBedroom: UILabel!                   //done
    @IBOutlet weak var numberOfLivingroom: UILabel!                 //done
    @IBOutlet weak var numberOfBathroom: UILabel!                   //done
    @IBOutlet weak var numberOfKitchen: UILabel!                        //done
    @IBOutlet weak var areaOfEstraha: UILabel!                              //done
    @IBOutlet weak var summaryOfEstraha: UILabel!                       //done
    @IBOutlet weak var activitiesOfEstraha: UILabel!                        //done
    
 // here the tableView of bayment Activity
    @IBOutlet weak var baymentActivityTableView: UITableView!
    
// here time of entry of full day
    @IBOutlet weak var timeOfEntry: UILabel!                                // done
    
// here time of out of estraha of full day
    @IBOutlet weak var timeOfOut: UILabel!                                  // done

// here time of entry of half day morning
    @IBOutlet weak var timeOfEntryHalfMorning: UILabel!                 //done

// here time of out of estraha of half day morning
    @IBOutlet weak var timeOfOutHalfMorning: UILabel!                       //done

// here time of entry of half day night
    @IBOutlet weak var timeOfEntryHalfNight: UILabel!                           //done

// here time of out of estraha of half day night
    @IBOutlet weak var timeOfOutHalfNight: UILabel!                             //done

// here details of order if full day or half day
    var fullDayOrder = true
    var halfDayOrder = false
    @IBOutlet weak var fullDayOrderSwitsh: UISwitch!
    @IBOutlet weak var halfDayOrderSwitsh: UISwitch!
    
    
    
// here details of price of days in study days                                      // done all

    @IBOutlet weak var priceOfAnyDayStudy: UILabel!
    @IBOutlet weak var priceOfHalfAnyDayStudy: UILabel!
    @IBOutlet weak var priceOfWeekendDayStudy: UILabel!
    @IBOutlet weak var priceOfHalfWeekendDayStudy: UILabel!
    
    
    
// here details of price of days in holidays                                            // done all
    @IBOutlet weak var priceOfAnyDayHoliday: UILabel!
    @IBOutlet weak var priceOfHalfAnyDayHoliday: UILabel!
    @IBOutlet weak var priceOfWeekendDayHoliday: UILabel!
    @IBOutlet weak var priceOfHalfWeekendDayholiday: UILabel!
    
// here details of price of days in Eid Days                                    // donw all
    @IBOutlet weak var priceOfDayEid: UILabel!
    @IBOutlet weak var priceOfHalfDayEid: UILabel!
    
// here price of deposit                                                                // done all
    @IBOutlet weak var priceOfDeposit: UILabel!
    
 /*   ----------------------END OF OUTLETS CONNICTIONS----------------------  */
    
    var estrahatARRDetails : EstrahaData?{
        didSet{
            print("Hey I am In details VC Go!!")
            print("estrahatARRDetails: \(estrahatARRDetails?.city!)")
            print("estrahatARRDetails: \(estrahatARRDetails?.address!)")
            DispatchQueue.main.async {
                self.callAPI()
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        baymentActivityTableView.delegate = self
        baymentActivityTableView.dataSource = self
        //callAPI()
    
    }
    
    
    func callAPI(){

            self.cityLbl.text = self.estrahatARRDetails?.city!
            self.adressLbl.text = self.estrahatARRDetails?.address!
            self.numberOfBedroom.text = self.estrahatARRDetails?.bed!
            self.numberOfLivingroom.text = self.estrahatARRDetails?.living!
            self.numberOfBathroom.text = self.estrahatARRDetails?.bath!
            self.numberOfKitchen.text = self.estrahatARRDetails?.cooking!
            self.areaOfEstraha.text = self.estrahatARRDetails?.area!
            self.summaryOfEstraha.text = self.estrahatARRDetails?.description!
            self.activitiesOfEstraha.text = self.estrahatARRDetails?.marafq!
            self.timeOfEntry.text = self.estrahatARRDetails?.full_in!
            self.timeOfOut.text = self.estrahatARRDetails?.full_out!
            self.timeOfEntryHalfMorning.text = self.estrahatARRDetails?.m_mid_in!
            self.timeOfOutHalfMorning.text = self.estrahatARRDetails?.m_mid_out!
            self.timeOfEntryHalfNight.text = self.estrahatARRDetails?.n_mid_in!
            self.timeOfOutHalfNight.text = self.estrahatARRDetails?.n_mid_out!
            self.priceOfAnyDayStudy.text = self.estrahatARRDetails?.price1!
            self.priceOfHalfAnyDayStudy.text = self.estrahatARRDetails?.price2!
            self.priceOfWeekendDayStudy.text = self.estrahatARRDetails?.price3!
            self.priceOfHalfWeekendDayStudy.text = self.estrahatARRDetails?.price4!
            self.priceOfAnyDayHoliday.text  = self.estrahatARRDetails?.price5!
            self.priceOfHalfAnyDayHoliday.text = self.estrahatARRDetails?.price6!
            self.priceOfWeekendDayHoliday.text = self.estrahatARRDetails?.price7!
            self.priceOfHalfWeekendDayholiday.text = self.estrahatARRDetails?.price8!
            self.priceOfDayEid.text = self.estrahatARRDetails?.price9!
            self.priceOfHalfDayEid.text = self.estrahatARRDetails?.price10!
            self.priceOfDeposit.text = self.estrahatARRDetails?.cost!
            
//        }
        
    }
    
    
    @IBAction func fullDayOrderSwichtPressed(_ sender: Any) {
        self.fullDayOrder = true
        self.halfDayOrder = false
        self.halfDayOrderSwitsh.isOn = false
        self.fullDayOrderSwitsh.isOn = true
    }
    @IBAction func halfDayOrderSwichPressed(_ sender: Any) {
        self.fullDayOrder = false
        self.halfDayOrder = true
        self.halfDayOrderSwitsh.isOn = true
        self.fullDayOrderSwitsh.isOn = false
    }
    
    
    
    // table view funcitions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "khadmatMadfoaa", for: indexPath)as? khdmatMadfo3aCell{
            return cell
        }else{
            return khdmatMadfo3aCell()
        }
    }
    
    
    
    // order Button Pressed Funcition
    @IBAction func orderButtonPressed(_ sender: Any) {
        
        
        
        
    }
    
}
