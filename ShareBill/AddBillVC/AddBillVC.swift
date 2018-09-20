//
//  AddBillVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

class AddBillVC: UIViewController {

    @IBOutlet weak var inDate: UIDatePicker!
    @IBOutlet weak var outDate: UIDatePicker!
    @IBOutlet weak var amount: UITextField!
    
    var bill: Bill!
    var tenants: [Tenant] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTenants()
        
    }

    @IBAction func calculateButtonAction(_ sender: Any) {
        guard let amount = amount.text?.toDouble() else {return}
        bill = Bill(amount: amount, startDate: inDate.date, endDate: outDate.date)
        let interactor = CalculateInteractor()
        let amountPerDay = interactor.getCostPerDayPerPerson(for: tenants, for: bill)
        print("----------------Bill details----------------")
        print("Total amount: \(bill.amount)")
        print("Time interval: \(bill.startDate) - \(bill.endDate)")
        print("Amount per day / person: \(amountPerDay)")
        print("--------------------------------------------")
        for tenant in tenants {
            let days = interactor.getNumberOfDays(per: tenant, for: bill)
            tenant.days = days
        let amountPerPerson = Double(tenant.days) * interactor.getCostPerDayPerPerson(for: tenants, for: bill)
            
            print("----------------Tenant details----------------")
            print("Name: \(tenant.name)")
            print("Move in date: \(tenant.inDate)")
            print("Move out date: \(tenant.outDate)")
            print("Amount to pay: \(amountPerPerson)")
        }
    }
    

    func fetchTenants() {
        self.tenants.removeAll()
        let realm = try! Realm()
        let tenants = realm.objects(Tenant.self)
        for newTenant in tenants {
            let tenant = Tenant()
            tenant.name = newTenant.name
            tenant.inDate = newTenant.inDate
            tenant.outDate = newTenant.outDate
            self.tenants.append(tenant)
        }
    }

    
    
}
