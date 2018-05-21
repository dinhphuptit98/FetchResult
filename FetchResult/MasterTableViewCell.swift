//
//  MasterTableViewCell.swift
//  FetchResult
//
//  Created by dinhphu98 on 5/9/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    @IBOutlet weak var imageHero: UIImageView!
    @IBOutlet weak var propertiesText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
//imageHero
//nameText
//propertiesText
