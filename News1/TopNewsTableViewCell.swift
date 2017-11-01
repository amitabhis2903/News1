//
//  TopNewsTableViewCell.swift
//  News1
//
//  Created by Ammy Pandey on 29/07/17.
//  Copyright © 2017 Ammy Pandey. All rights reserved.
//

import UIKit

class TopNewsTableViewCell: UITableViewCell {
    @IBOutlet weak var imgOfNews: UIImageView!
    @IBOutlet weak var headlineLbl: UILabel!
    @IBOutlet weak var discriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
