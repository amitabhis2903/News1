//
//  LatestTableViewCell.swift
//  News1
//
//  Created by Ammy Pandey on 29/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class LatestTableViewCell: UITableViewCell {

    @IBOutlet weak var discriptionLbl: UILabel!
    @IBOutlet weak var headlineLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

}
