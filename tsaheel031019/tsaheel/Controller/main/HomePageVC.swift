//
//  HomePageVC.swift
//  tsaheel
//
//  Created by Islam Swira on 8/22/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
import BRYXBanner
class HomePageVC: UIViewController, SWRevealViewControllerDelegate{
    
    @IBOutlet weak var MainCollection: UICollectionView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var logoBtn: UIBarButtonItem!
    
    // private(set) public var compoents = [HomePageModel]()
    //general values to use in side menue
    //let tableView = UITableView()
    let screenSize = UIScreen.main.bounds
    //let TransperantView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MainCollection.delegate = self
        MainCollection.dataSource = self
        
        
        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        btnBar.title = " "
        self.navigationItem.backBarButtonItem = btnBar
        MainCollection.backgroundColor = .clear
        //delegate of swreveal SideMenu
        self.revealViewController().delegate = self
        
        
        if CheckInternet.Connection() == false{
            let banner = Banner(title: "خطأ", subtitle: "يوجد مشكلة في الاتصال بالشبكة", backgroundColor: UIColor(red:255.0/255.0, green:0/255.0, blue:0/255.0, alpha:1.000))
            banner.dismissesOnTap = true
            banner.show(duration: 3.0)
        }
        
        
        
        
        sidemenu()
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
    
    
    //we will use viewwillAppear and viewWillDisappear to show or hid sidemenu
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.revealViewController()?.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().frontViewController.revealViewController().tapGestureRecognizer()
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.revealViewController().frontViewController.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().frontViewController.view.isUserInteractionEnabled = true
        
    }
    func sidemenu(){
        if self.revealViewController() != nil {
            menuBtn.target = self.revealViewController()
            menuBtn.action = #selector(SWRevealViewController.rightRevealToggle(_:))
            self.revealViewController()?.rightViewRevealWidth = 275
            
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer()!)
            self.revealViewController().panGestureRecognizer().isEnabled = true
            
            
        }
    }
    
    
    
    
}
extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource{
    //
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        return 5
    //    }
    //
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        return tableView.dequeueReusableCell(withIdentifier: "Cell")!
    //    }
    //    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let vw = UIView()
    //
    //        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    //        backgroundImage.image = UIImage(named: "logo")
    //        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
    //        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
    //        vw.insertSubview(backgroundImage, at: 0)
    //        NSLayoutConstraint.activate([
    //            backgroundImage.leadingAnchor.constraint(equalTo: vw.layoutMarginsGuide.leadingAnchor),
    //            backgroundImage.trailingAnchor.constraint(equalTo: vw.layoutMarginsGuide.trailingAnchor),
    //            backgroundImage.bottomAnchor.constraint(equalTo: vw.layoutMarginsGuide.bottomAnchor),
    //            backgroundImage.topAnchor.constraint(equalTo: vw.layoutMarginsGuide.topAnchor),
    //
    //            ])
    //
    //        return vw
    //    }
    //    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 70
    //    }
    //
    //
}

