//
//  tfaselEstrahaVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/16/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import GoogleMaps
import AlamofireImage
import BRYXBanner
class tfaselEstrahaVC: UIViewController {

    @IBOutlet weak var tfaselView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var nameOfEstraha: UILabel!
    @IBOutlet weak var imgOfEstraha: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    var location: [String:String] = ["lat":"0.0",
                                     "long":"0.0"]
    var estrahatARR : EstrahaData?
    var estrahaID: String?{
        didSet{
            print("hey iam changed ID = \(estrahaID!)")
            let estrahaIdInt = Int(estrahaID!)
            api.getEstrahaDetails(EstrahaID: estrahaIdInt!) { (Details, err) in
                
                if err != nil{
                    print(err!)
                }else{
                    
                    let details = Details?.data?.first
                    
                    self.estrahatARR = details
                    //                self.location["lat"] = details?.lat!
                    //                self.location["long"] = details?.lng!
                    print("Data Reached to tfasel =  \(self.estrahatARR)")
                                    DispatchQueue.main.async {
                                        self.nameOfEstraha.text = (self.estrahatARR?.title)!
                                        let imageURL = URL(string: self.estrahatARR?.img ?? "")
                                        self.imgOfEstraha.af_setImage(withURL: imageURL!)
                                    }
                    
                    //to start load details VC after getting id value
                    self.locationView.alpha = 0
                    self.tfaselView.alpha = 1
                    
                    self.add(asChildViewController: self.DetailsViewController, view: self.self.tfaselView)
                    self.remove(asChildViewController: self.MapViewController)
                    self.scrollView.contentSize.height = self.tfaselView.frame.size.height + 500
                }
            }
            
        }
    }
    private lazy var DetailsViewController: DetailsViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "estrahaSB", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "detailsVc") as! DetailsViewController
        viewController.estrahatARRDetails = estrahatARR
        // Add View Controller as Child View Controller
        self.addChild(viewController)
        
        return viewController
    }()
    private lazy var MapViewController: MapViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "estrahaSB", bundle: Bundle.main)
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
        viewController.estrahatARRDetails = estrahatARR
        // Add View Controller as Child View Controller
        self.addChild(viewController)
        
        return viewController
    }()
    private func add(asChildViewController viewController: UIViewController,view: UIView) {
        // Add Child View Controller
        addChild(viewController)
        
        // Add Child View as Subview
        view.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = locationView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParent: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParent()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if CheckInternet.Connection() == false{
            let banner = Banner(title: "خطأ", subtitle: "يوجد مشكلة في الاتصال بالشبكة", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
        }
        
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }


  
    @IBAction func SwichViews(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            locationView.alpha = 1
            tfaselView.alpha = 0
            scrollView.contentSize = locationView.frame.size
//            let vc = storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapViewController
//            print("location in segment control before moving to map: \(location["lat"]!)")
//            //vc.location = location
            add(asChildViewController: MapViewController, view: locationView)
            remove(asChildViewController: DetailsViewController)

        }else if sender.selectedSegmentIndex == 1 {
            locationView.alpha = 0
            tfaselView.alpha = 1

            add(asChildViewController: DetailsViewController, view: tfaselView)
            remove(asChildViewController: MapViewController)
            scrollView.contentSize.height = tfaselView.frame.size.height + 500

        }
    }
}

