//
//  Bill.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 16/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import RealmSwift

class Bill: Object {
    @objc dynamic var id = ""
    @objc dynamic var amount: Double = 0.0
    @objc dynamic var startDate: Date = Date(timeIntervalSinceNow: 0)
    @objc dynamic var endDate: Date = Date(timeIntervalSinceNow: 0)
    @objc dynamic var isCurrent: Bool = false

    
    override static func primaryKey() -> String? {
        return "id"
    }
}

