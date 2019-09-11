//
//  homePageCell.swift
//  tsaheel
//
//  Created by Islam Swira on 8/22/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class homePageCell: UICollectionViewCell {
    
    @IBOutlet weak var componentImage: UIImageView!
    @IBOutlet weak var componentTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10
        layer.shadowRadius = 10
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.5
        layer.borderWidth = 0.2
        layer.borderColor = #colorLiteral(red: 0.1107323244, green: 0.6755879521, blue: 0.3785024881, alpha: 1)
        
    }
    
    func updateViews(component:HomePageModel){
        componentImage.image = UIImage(named: component.imageName)
        componentTitle.text = component.title
        
    }
    
    
}
