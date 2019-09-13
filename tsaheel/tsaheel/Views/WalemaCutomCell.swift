//
//  MtabekhCustomCell.swift
//  tsaheel
//
//  Created by Islam Swira on 9/11/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class WalemaCutomCell: UITableViewCell {
    @IBOutlet weak var mtabekhImg: UIImageView!
    
    @IBOutlet weak var mtabekhName: UILabel!
    @IBOutlet weak var chefName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
