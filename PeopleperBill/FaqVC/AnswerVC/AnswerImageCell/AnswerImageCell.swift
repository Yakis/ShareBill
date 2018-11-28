//
//  AnswerImageCell.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import Nuke

class AnswerImageCell: UITableViewCell {

    
    
    @IBOutlet weak var answerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupWith(image: String) {
        guard let url = URL(string: image) else {return}
        Nuke.loadImage(with: url, into: answerImageView)
    }
    
}
