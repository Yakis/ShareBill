//
//  BillCell.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 24/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell {

    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var lenghtLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var arrowLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with bill: Bill) {
        let startDate = bill.startDate.shortDateString()
        let endDate = bill.endDate.shortDateString()
        self.amountLabel.text = "Amount: \(bill.amount)"
        self.lenghtLabel.text = "\(startDate) - \(endDate)"
        if bill.isCurrent {
            self.containerView.alpha = 0.9
            arrowLabel.text = "⬅︎"
        } else {
            self.containerView.alpha = 1.0
            arrowLabel.text = ""
        }
    }
    
}
