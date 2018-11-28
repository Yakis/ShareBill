//
//  BillsVM.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 18/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct BillsVM {
    
    var dataInteractor = DataInteractor()
    var bills = BehaviorRelay(value: Array<Bill>())
    
    
    
    func fetchBills() {
       self.bills.accept([])
        dataInteractor.fetchBills { (bills) in
            self.bills.accept(bills)
        }
        
    }
    
    
}
