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
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with bill: Bill) {
        
        let startDate = bill.startDate.shortDateString()
        let endDate = bill.endDate.shortDateString()
        self.amountLabel.text = "Amount: \(bill.amount)"
        self.lenghtLabel.text = "\(startDate) - \(endDate)"
        
    }
    
}
