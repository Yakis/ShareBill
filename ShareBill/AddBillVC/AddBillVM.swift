//
//  AddBillVM.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 29/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

struct AddBillVM {
    
    let dataInteractor = DataInteractor()
    let dateFormatter = DateFormatter()
    
    var amount: String?
    var startDate: String?
    var endDate: String?
    
    var saveDone = BehaviorRelay(value: false) 
    
//    init(amount: String, startDate: String, endDate: String) {
//        self.amount = amount
//        self.startDate = startDate
//        self.endDate = endDate
//    }
    
    private var _amount: Double {
        guard let amount = amount else {return 0.0}
        return amount.toDouble()!
    }
    
    private var _startDate: Date {
        dateFormatter.dateStyle = .medium
        guard let startDate = dateFormatter.date(from: startDate!) else {return Date()}
        return startDate
    }
    
    private var _endDate: Date {
        dateFormatter.dateStyle = .medium
        guard let endDate = dateFormatter.date(from: endDate!) else {return Date()}
        return endDate
    }
    
    
    
    func saveBill() {
        let newBill = Bill()
        newBill.amount = _amount
        newBill.startDate = _startDate
        newBill.endDate = _endDate
        dataInteractor.save(bill: newBill) {
            saveDone.accept(true)
        }
    }
    
    func updateBill() {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .medium
//        let realm = try! Realm()
//        let theBill = realm.objects(Bill.self).filter("amount == %@", bill.amount).first
//        guard let amount = amountTextField.text?.toDouble() else {return}
//        guard let startDateString = startDateTextField.text else {return}
//        guard let endDateString = endDateTextField.text else {return}
//        guard let startDate = dateFormatter.date(from: startDateString) else {return}
//        guard let endDate = dateFormatter.date(from: endDateString) else {return}
//        try! realm.write {
//            theBill?.amount = amount
//            theBill?.startDate = startDate
//            theBill?.endDate = endDate
//        }
//        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    
}
