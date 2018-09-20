//
//  Extensions.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 20/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension Date {
    
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int {
        let currentCalendar = Calendar.current
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        return end - start
    }
}


extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX") as Locale
        return numberFormatter.number(from: self)?.doubleValue
    }
}


extension Double {
    func roundUp(toNearest: Double) -> Double {
        return ceil(self / toNearest) * toNearest
    }
}
