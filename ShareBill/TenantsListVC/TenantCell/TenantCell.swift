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

    
    func setup(with user: User) {
        self.nameLabel.text = user.name
        self.moveInLabel.text = "\(user.inDate)"
        self.moveOutLabel.text = "\(user.outDate)"
    }
    
    
    
}
