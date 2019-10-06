//
//  EstrahatListVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/11/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import AlamofireImage
class EstrahatListVC: UIViewController , UITableViewDataSource ,UITableViewDelegate {

  
    @IBOutlet weak var estrahatTableView: UITableView!
    
    var estrahatARR : [EstrahaData] = [EstrahaData]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        
        estrahatTableView.dataSource = self
        estrahatTableView.delegate = self
        
        print("estrahaArr is filled with \(estrahatARR.count)")
        self.estrahatTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return estrahatARR.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if  let cell = tableView.dequeueReusableCell(withIdentifier: "estahaCell", for: indexPath)as? EstrahatcutomCell{
        cell.EstrahaName.text = estrahatARR[indexPath.row].title!
        cell.estrahaDescriptionLbl.text = estrahatARR[indexPath.row].description!
        let imageURL = URL(string: estrahatARR[indexPath.row].img ?? "")
        cell.EstrahaImg.af_setImage(withURL: imageURL!)
            return cell
       }else{
        return EstrahatcutomCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "tfaselEstrahaVC") as? tfaselEstrahaVC
        vc?.estrahaID = estrahatARR[indexPath.row].id!
        print("est ID = \(vc!.estrahaID!)")
        //print("est ID = \(estrahatARR[indexPath.row].id!)")
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
    }
    
//     func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        if (segue.identifier == "tfaselEstrahaVC") {
//            // pass data to next view
//            if let nextViewController = segue.destination as? tfaselEstrahaVC {
//                nextViewController.location = location
//
//
//            }
//        }
//    }

}
