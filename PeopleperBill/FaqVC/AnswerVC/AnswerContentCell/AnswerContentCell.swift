//
//  AnswerContentCell.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class AnswerContentCell: UITableViewCell {

    
    @IBOutlet weak var answerContentLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    func setupWith(content: String) {
        self.answerContentLabel.text = content
    }
    
    
}
