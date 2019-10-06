//
//  m4tryatyCustomCell.swift
//  tsaheel
//
//  Created by Islam Swira on 10/6/19.
//  Copyright © 2019 com.Islam Swira. All rights reserved.
//

import UIKit

class m4tryatyCustomCell: UITableViewCell {

    @IBOutlet weak var nameOfItem: UILabel!
    @IBOutlet weak var sizeOfItem: UILabel!
    @IBOutlet weak var numberOfItem: UILabel!
    @IBOutlet weak var priceOfItem: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func deleteOfItemButtonPressed(_ sender: Any) {
        
    }
}
