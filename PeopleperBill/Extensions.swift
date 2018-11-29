//
//  Extensions.swift
//  People per bill
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
    
    
    func shortDateString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }
    
    
}


extension String {
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US_POSIX") as Locale
        return numberFormatter.number(from: self)?.doubleValue
    }
    
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.date(from: self) ?? Date()
    }
    
}


extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
    
}


extension NSObject {
    
    static var nibName: String {
        return String(describing: self)
    }

}


extension Notification.Name {
    static let alert = Notification.Name("alert")
    static let popToRootVC = Notification.Name("popToRootVC")
    static let keyboardActive = Notification.Name("keyboardActive")
}


extension UIViewController {
    class func displaySpinner(onView: UIView) -> UIView {
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.frame = onView.bounds
        ai.center = onView.center
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.startAnimating()
        
        DispatchQueue.main.async {
            onView.addSubview(ai)
            ai.centerXAnchor.constraint(equalTo: onView.centerXAnchor).isActive = true
            ai.centerYAnchor.constraint(equalTo: onView.centerYAnchor).isActive = true
        }
        
        return ai
    }
    
    class func removeSpinner(spinner: UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}
