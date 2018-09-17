//
//  Bill.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 16/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation


class Bill {
    
    var amount: Double
    var startDate: Date
    var endDate: Date
    
    
    init(amount: Double, startDate: Date, endDate: Date) {
        self.amount = amount
        self.startDate = startDate
        self.endDate = endDate
    }
    
    
}
