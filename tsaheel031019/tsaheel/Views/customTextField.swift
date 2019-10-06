//
//  customTextField.swift
//  tsaheel
//
//  Created by Islam Swira on 8/20/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

@IBDesignable
class customTextField: UITextField {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        
    }
    // make corner radies
    /*required init?(coder aDecoder: NSCoder) {
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
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10{
        didSet{
            roundedCorners(value: cornerRadius)
        }
    }*/
    // make corner reduios
    @IBInspectable var cornerRedios:CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRedios
        }
    }
    // make photo to text feild
    @IBInspectable var rightImg:UIImage? {
        didSet {
            updateView()
        }
    }
    // make left padding
    @IBInspectable var rightPadding:CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView(){
        
        if let image = rightImg {
            // there is Imge here..
            rightViewMode = .always
            // add image and allignment it
            let imageView = UIImageView(frame: CGRect(x: rightPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            // add new view to make padding
            let width = rightPadding + 30
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            rightView = view
        }else {
            //img is null..
            rightViewMode = .never
        }
      
        
        
    }
    
    


}
