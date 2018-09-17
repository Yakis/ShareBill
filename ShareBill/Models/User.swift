//
//  User.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 16/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation


class User {
    
    var name: String
    var inDate: Date
    var outDate: Date
    var amount: Double?
    
    
    init(name: String, inDate: Date, outDate: Date) {
        self.name = name
        self.inDate = inDate
        self.outDate = outDate
    }
    
    
    
    
}
