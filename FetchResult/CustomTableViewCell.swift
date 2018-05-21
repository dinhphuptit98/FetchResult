//
//  CustomTableViewCell.swift
//  FetchResult
//
//  Created by dinhphu98 on 5/8/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var propertiesText: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
