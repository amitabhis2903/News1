//
//  PopularTableViewCell.swift
//  News1
//
//  Created by Ammy Pandey on 30/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class PopularTableViewCell: UITableViewCell {
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var headlineLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
