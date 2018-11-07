//
//  AnswerTitleCell.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class AnswerTitleCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWith(title: String) {
        titleLabel.text = title
    }
    
}
