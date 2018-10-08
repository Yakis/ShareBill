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
    
    
    func fetchTenants() -> [Tenant] {
        var tenants = [Tenant]()
        let realm = try! Realm()
        let fetchedTenants = realm.objects(Tenant.self)
        for newTenant in fetchedTenants {
            print(newTenant.days)
            let tenant = Tenant()
            tenant.name = newTenant.name
            tenant.inDate = newTenant.inDate
            tenant.outDate = newTenant.outDate
            tenant.days = newTenant.days
            tenant.amount = newTenant.amount
            tenants.append(tenant)
        }
        return tenants
    }
    
    
    
    func updateAmountAndDays(tenant: Tenant, amount: Double, days: Int) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
        let realm = try! Realm()
        let theTenant = realm.objects(Tenant.self).filter("name == %@", tenant.name).first
        try! realm.write {
            theTenant!.amount = amount
            theTenant?.days = days
                }
            }
        }
    }
    
}
