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
        self.nameLabel.text = tenant.name
        self.moveInLabel.text = "\(tenant.inDate)"
        self.moveOutLabel.text = "\(tenant.outDate)"
    }
    
    
    
}
