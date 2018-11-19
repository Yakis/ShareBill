//
//  Constants.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 26/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


struct Colors {
    static let maritimeBlue = UIColor(red: 0/255, green: 157/255, blue: 220/255, alpha: 1.0)
    static let maritimeGreen = UIColor(red: 0/255, green: 155/255, blue: 114/255, alpha: 1.0)
    static let maritimePurple = UIColor(red: 103/255, green: 97/255, blue: 168/255, alpha: 1.0)
    static let maritimeOrange = UIColor(red: 242/255, green: 100/255, blue: 48/255, alpha: 1.0)
    static let inactiveOrange = UIColor(red: 110/255, green: 46/255, blue: 22/255, alpha: 1.0)
    static let maritimeDark = UIColor(red: 42/255, green: 45/255, blue: 52/255, alpha: 1.0)
}

struct Messages {
    static let userDeleteConfirmation = "Are you sure you want to delete this user?"
    static let billDeleteConfirmation = "Are you sure you want to delete this bill?"
    
    static let noBillsPlaceholder = "There's no bill yet, \nplease add yours from the top right button"
    static let noTenantsPlaceholder = "There's no tenant yet, \nyou can add tenants from the top right button"
    
    static let enterAmount = "Please enter the amount"
    static let selectStartingDate = "Please select the start date"
    static let selectEndDate = "Please select the end date"
    
    static let enterName = "Please enter the tenant name"
    static let selectMovingInDate = "Please select the moving in date"
    static let selectMovingOutDate = "Please select the moving out date or switch to 'Still living here'"
}
