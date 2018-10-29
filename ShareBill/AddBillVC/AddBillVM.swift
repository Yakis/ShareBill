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
    var bill: Bill!
    var saveDone = BehaviorRelay(value: false) 
    
    
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
        newBill.id = UUID().uuidString
        dataInteractor.save(bill: newBill) {
            saveDone.accept(true)
        }
    }
    
    func updateBill() {
        bill.amount = _amount
        bill.startDate = _startDate
        bill.endDate = _endDate
        bill.id = bill.id
        dataInteractor.update(with: bill) {
            saveDone.accept(true)
        }
    }
    
    
    
    
}
