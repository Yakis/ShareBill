//
//  AnswerImageCell.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class AnswerImageCell: UITableViewCell {

    
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWith(image: String) {
        self.answerImageView.image = UIImage(named: image)
    }
    
}
