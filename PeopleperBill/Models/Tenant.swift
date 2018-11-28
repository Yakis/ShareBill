//
//  User.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 16/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import RealmSwift

class Tenant: Object {
    
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var inDate: Date = Date(timeIntervalSinceNow: 0)
    @objc dynamic var outDate: Date = Date(timeIntervalSinceNow: 0)
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var stillLivingHere = false
    @objc dynamic var days: Int = 0
    

    override static func primaryKey() -> String? {
        return "id"
    }
    

}
