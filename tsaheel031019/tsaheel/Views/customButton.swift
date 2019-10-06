//
//  customButton.swift
//  tsaheel
//
//  Created by Islam Swira on 8/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class customButton: UIButton {
    
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        roundedCorners(value: cornerRadius)
    }
    
    func roundedCorners(value: CGFloat){
        layer.cornerRadius = value
        layer.shadowRadius = 8
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
    }
    
    @IBInspectable var cornerRadius: CGFloat = 6{
        didSet{
            roundedCorners(value: cornerRadius)
        }
    }
}
