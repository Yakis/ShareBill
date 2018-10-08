//
//  CalculateInteractor.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 20/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


class CalculateInteractor {
    
    var tenants: [Tenant] = []
    var dataInteractor = DataInteractor()
    
    
    
    func getNumberOfDays(per tenant: Tenant, for bill: Bill) -> Int {
        var inDate: Date = Date(timeIntervalSinceNow: 0)
        var outDate: Date = Date(timeIntervalSinceNow: 0)
        switch tenant.inDate >= bill.startDate {
        case true:
            inDate = tenant.inDate
        case false:
            inDate = bill.startDate
        }
        switch tenant.outDate >= bill.endDate {
        case true:
            outDate = bill.endDate
        case false:
            outDate = tenant.outDate
        }
        return outDate.interval(ofComponent: .day, fromDate: inDate)
    }
    
    
    func getTotalNumberOfDays(for tenants: [Tenant], for bill: Bill) -> Double {
        var totalDays = 0
        for tenant in tenants {
            if bill.endDate > tenant.inDate && bill.startDate < tenant.outDate {
            totalDays += getNumberOfDays(per: tenant, for: bill)
            }
        }
        return Double(totalDays)
    }
    
    
    func getCostPerDayPerPerson(for tenants: [Tenant], for bill: Bill) -> Double {
        return bill.amount / getTotalNumberOfDays(for: tenants, for: bill)
    }
    
    
    func calculate(bill: Bill, completion: (Tenant, Double, Int) -> ()) {
        self.tenants = dataInteractor.fetchTenants()
        var total = 0.0
        for tenant in tenants {
            if bill.endDate > tenant.inDate && bill.startDate < tenant.outDate {
                let days = getNumberOfDays(per: tenant, for: bill)
                tenant.days = days
                let amountPerPerson = Double(tenant.days) * getCostPerDayPerPerson(for: tenants, for: bill)
                completion(tenant, amountPerPerson, days)
                total += amountPerPerson
            } else {
                completion(tenant, 0.0, 0)
            }
        }
    }
    
    
}
