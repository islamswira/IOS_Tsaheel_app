//
//  khdmatMadfo3aCell.swift
//  tsaheel
//
//  Created by Islam Swira on 9/16/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class khdmatMadfo3aCell: UITableViewCell {


    @IBOutlet weak var nameOfKhedma: UILabel!
    @IBOutlet weak var priceOfKhedma: UILabel!
    @IBOutlet weak var switchForKhedma: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
