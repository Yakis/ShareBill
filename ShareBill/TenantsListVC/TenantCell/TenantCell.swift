//
//  TenantCell.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class TenantCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moveInLabel: UILabel!
    @IBOutlet weak var moveOutLabel: UILabel!
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    func setup(with tenant: Tenant) {
        print(tenant.amount)
        print(tenant.days)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let inDate = dateFormatter.string(from: tenant.inDate)
        let outDate = dateFormatter.string(from: tenant.outDate)
        self.nameLabel.text = tenant.name
        self.moveInLabel.text = "Move in: \(inDate)"
        let today = Date()
        if today.interval(ofComponent: .day, fromDate: tenant.outDate) == 1 {
            self.moveOutLabel.text = "Still living here"
        } else {
            self.moveOutLabel.text = "Move out: \(outDate)"
            
        }
    }
    
    
    
}
