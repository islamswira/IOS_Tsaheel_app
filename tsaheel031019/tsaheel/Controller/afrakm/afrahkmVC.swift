//
//  afrahkmVC.swift
//  tsaheel
//
//  Created by Islam Swira on 9/4/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class afrahkmVC: UIViewController, SWRevealViewControllerDelegate {
    
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnBar = UIBarButtonItem()
        // btnBar.image = UIImage(named: "Phone")
        title = ""
        self.navigationItem.backBarButtonItem = btnBar
        self.revealViewController().delegate = self
        
        sidemenu()
    }
    
    
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
    
    @IBAction func unwindToAfrahkom(_ sender: UIStoryboardSegue){}
    
    
    
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
