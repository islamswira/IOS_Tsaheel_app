//
//  CustomTableViewCell.swift
//  tsaheel
//
//  Created by Islam Swira on 9/11/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class EstrahatcutomCell: UITableViewCell {

    @IBOutlet weak var EstrahaImg: UIImageView!
    @IBOutlet weak var EstrahaName: UILabel!
    @IBOutlet weak var estrahaDescriptionLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func estrahaDetailsBtn(_ sender: Any) {
    }
}
