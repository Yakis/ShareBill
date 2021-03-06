//
//  TenantCell.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class TenantCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moveInLabel: UILabel!
    @IBOutlet weak var moveOutLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func setup(with tenant: Tenant) {
        let inDate = tenant.inDate.shortDateString()
        let outDate = tenant.outDate.shortDateString()
        self.amountLabel.text = "£\(tenant.amount.roundToDecimal(2))"
        self.daysLabel.text = "Days: \(tenant.days)"
        self.nameLabel.text = tenant.name
        self.moveInLabel.text = "Moved in: \(inDate)"
        if tenant.stillLivingHere == true {
            self.moveOutLabel.text = "Still living here"
        } else {
            self.moveOutLabel.text = "Moved out: \(outDate)"
            
        }
    }
    
    
    
}
