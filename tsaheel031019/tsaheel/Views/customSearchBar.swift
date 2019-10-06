//
//  customSearchBar.swift
//  tsaheel
//
//  Created by Islam Swira on 8/22/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit
@IBDesignable
class customSearchBar: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.1107323244, green: 0.6755879521, blue: 0.3785024881, alpha: 1)
    }
    
    // make photo to text feild
    @IBInspectable var leftImg:UIImage? {
        didSet {
            updateView()
        }
    }
    // make left padding
    @IBInspectable var leftPadding:CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView(){
        
        if let image = leftImg {
            // there is Imge here..
            leftViewMode = .always
            // add image and allignment it
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 25, height: 25))
            imageView.image = image
            // add new view to make padding
            let width = leftPadding + 35
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftView = view
        }else {
            //img is null..
            leftViewMode = .never
        }
        
        
        
    }

}
