//
//  TenantsListVM.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 29/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

struct TenantsListVM {
    
    
    var calculateInteractor = CalculateInteractor()
    var dataInteractor = DataInteractor()
    var tenants = BehaviorRelay(value: Array<Tenant>())
    
    
    
    func fetchTenants() {
        self.tenants.accept([])
        dataInteractor.fetchTenants { (tenants) in
            self.tenants.accept(tenants)
        }
    }
    
    
    func resetAmounts() {
        self.tenants.accept([])
        dataInteractor.resetAmounts {
            self.fetchTenants()
        }
    }
    
    
    
    func calculate() {
        let realm = try! Realm()
        if let bill = realm.objects(Bill.self).last {
            self.calculateInteractor.calculate(bill: bill) {
                self.fetchTenants()
            }
        }
            self.fetchTenants()
    }
    
    
    func delete(tenant: Tenant) {
        dataInteractor.delete(tenant: tenant) {
            self.calculate()
        }
    }
    
    
    
    
    
}
