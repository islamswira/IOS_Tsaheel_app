//
//  HomePageVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/22/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class HomePageVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var MainCollection: UICollectionView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var logoBtn: UIBarButtonItem!
    
   // private(set) public var compoents = [HomePageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCollection.delegate = self
        MainCollection.dataSource = self
        
        
        let btnBar = UIBarButtonItem()
       // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        MainCollection.backgroundColor = .clear
        sideMenu()
    }
    
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataServices.instance.getHomePageComponent().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as? homePageCell{
            let component = dataServices.instance.getHomePageComponent()[indexPath.row]
            cell.updateViews(component: component)
            return cell
        }else {
            return homePageCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// waht happen after selected item
        switch indexPath.row {
        case 0:
            // what happend here
            if let afrahkmVC = storyboard?.instantiateViewController(withIdentifier: "afrahkmVC") as? afrahkmVC {
                present(afrahkmVC, animated: true, completion: nil)
            }
            print("آفراحكم")
            
        case 1:
            // what happen here
            print("مؤنكم")
        case 2:
            // what happen here
            print("مشترياتي")
        case 3:
            // what happen here
            print("كروتي و بطاقاتي")
        case 4:
            // what happen here
            print("إعدادات")
        case 5:
            // what happen here
            print("اي كلام")
        
        default:
            print("nothing")
        }
        
    }

    // Side Meue func
    func sideMenu(){
        if revealViewController() != nil {
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            //revealViewController()?.rearViewRevealWidth = 270
            revealViewController()?.rightViewRevealWidth = 270
            
            
            //logoBtn.target = revealViewController()
            //logoBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            
            
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
            
            }
    }
   

        
    
    

}
