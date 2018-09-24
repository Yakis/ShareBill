//
//  BillCell.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 24/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class BillCell: UITableViewCell {

    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with bill: Bill) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let startDate = dateFormatter.string(from: bill.startDate)
        let endDate = dateFormatter.string(from: bill.endDate)
        self.amountLabel.text = "\(bill.amount)"
        self.startDateLabel.text = startDate
        self.endDateLabel.text = endDate
        
    }
    
}
