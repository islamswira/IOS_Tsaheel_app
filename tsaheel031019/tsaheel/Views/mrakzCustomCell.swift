//
//  mrakzCustomCell.swift
//  tsaheel
//
//  Created by Mohamed Elsayed on 9/18/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class mrakzCustomCell: UITableViewCell {

    @IBOutlet weak var imgOfMarkz: UIImageView!
    @IBOutlet weak var nameOfMarkz: UILabel!
    @IBOutlet weak var nameOfMangerOfMarkz: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
