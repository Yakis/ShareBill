//
//  AddBillVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

class BillsVC: UIViewController {

    @IBOutlet weak var inDate: UIDatePicker!
    @IBOutlet weak var outDate: UIDatePicker!
    @IBOutlet weak var amount: UITextField!
    
    var bill: Bill!
    var tenants: [Tenant] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchTenants()
        fetchBill()
    }

    @IBAction func calculateButtonAction(_ sender: Any) {
        let interactor = CalculateInteractor()
        let amountPerDay = interactor.getCostPerDayPerPerson(for: tenants, for: bill)
        print("----------------Bill details----------------")
        print("Total amount: \(bill.amount)")
        print("Time interval: \(bill.startDate) - \(bill.endDate)")
        print("Amount per day / person: \(amountPerDay)")
        for tenant in tenants {
            let days = interactor.getNumberOfDays(per: tenant, for: bill)
            tenant.days = days
        let amountPerPerson = Double(tenant.days) * interactor.getCostPerDayPerPerson(for: tenants, for: bill)
            updateTenant(tenant: tenant, amount: amountPerPerson, days: days)
            print("----------------Tenant details----------------")
            print("Name: \(tenant.name)")
            print("Move in date: \(tenant.inDate)")
            print("Move out date: \(tenant.outDate)")
            print("Amount to pay: \(amountPerPerson)")
        }
        self.tabBarController?.selectedIndex = 1
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
            tenant.days = newTenant.days
            tenant.amount = newTenant.amount
            self.tenants.append(tenant)
        }
    }

    
    func updateTenant(tenant: Tenant, amount: Double, days: Int) {
        DispatchQueue(label: "background").async {
            autoreleasepool {
                let realm = try! Realm()
                let theTenant = realm.objects(Tenant.self).filter("name == %@", tenant.name).first
                try! realm.write {
                    theTenant!.amount = amount
                    theTenant!.days = days
                }
            }
        }
    }
    
    
    
    func fetchBill() {
        let realm = try! Realm()
        guard let lastBill = realm.objects(Bill.self).last else {return}
        self.bill = lastBill
        print("AMOUNT===", bill.amount)
    }
    
    
    
  @objc func addTapped() {
    let addBillVC = AddBillVC(nibName: "AddBillVC", bundle: nil)
    self.navigationController?.pushViewController(addBillVC, animated: true)
    }
    
}
