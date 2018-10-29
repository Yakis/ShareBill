//
//  DataInteractor.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 08/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import RealmSwift


class DataInteractor {
    
    
    func fetchTenants(completion: ([Tenant]) -> ()) {
        var tenants = [Tenant]()
        let realm = try! Realm()
        let fetchedTenants = realm.objects(Tenant.self)
        for newTenant in fetchedTenants {
            let tenant = Tenant()
            tenant.name = newTenant.name
            tenant.inDate = newTenant.inDate
            tenant.outDate = newTenant.outDate
            tenant.days = newTenant.days
            tenant.amount = newTenant.amount
            tenant.stillLivingHere = newTenant.stillLivingHere
            tenants.append(tenant)
        }
        completion(tenants)
    }
    
    
    
    func fetchBills(completion: ([Bill]) -> ()) {
        var bills = [Bill]()
        let realm = try! Realm()
        let fetchedBills = realm.objects(Bill.self)
        for newBill in fetchedBills {
            let bill = Bill()
            bill.amount = newBill.amount
            bill.startDate = newBill.startDate
            bill.endDate = newBill.endDate
            bills.append(bill)
        }
       completion(bills)
    }
    
    
    func save(bill: Bill, completion: () -> ()) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(bill)
        }
        completion()
    }
    
    
    func updateAmountAndDays(tenant: Tenant, amount: Double, days: Int, completion: @escaping () -> ()) {
        DispatchQueue.main.async {
            autoreleasepool {
                let realm = try! Realm()
                let theTenant = realm.objects(Tenant.self).filter("name == %@", tenant.name).first
                realm.beginWrite()
                theTenant?.amount = amount
                theTenant?.days = days
                try! realm.commitWrite()
                completion()
//                self.fetchTenants (completion: { (tenants) in
//                   // completion(tenants)
//                })
            }
        }
    }
    
    func resetAmounts(completion: @escaping () -> ()) {
        DispatchQueue(label: "userInitiated").async {
            autoreleasepool {
                let realm = try! Realm()
                let fetchedTenants = realm.objects(Tenant.self)
                realm.beginWrite()
                for tenant in fetchedTenants {
                    tenant.setValue(0.0, forKeyPath: "amount")
                    tenant.setValue(0, forKeyPath: "days")
                }
                try! realm.commitWrite()
            }
            completion()
        }
    }
    
    
    func delete(tenant: Tenant, completion: () -> ()) {
        let realm = try! Realm()
        let tenantToDelete = realm.objects(Tenant.self).filter("name=%@",tenant.name)
        realm.beginWrite()
        realm.delete(tenantToDelete)
        do {
        try! realm.commitWrite()
            completion()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}
