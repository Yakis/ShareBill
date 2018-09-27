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
    @IBOutlet weak var tableView: UITableView!
    
    
    var tenants: [Tenant] = []
    var bills: [Bill] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        setupTableView()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.tableFooterView = UIView(frame: .zero)
        fetchTenants()
        fetchBills()
    }

    func calculate(bill: Bill) {
        var total = 0.0
        let interactor = CalculateInteractor()
        for tenant in tenants {
             if bill.endDate > tenant.inDate && bill.startDate < tenant.outDate {
                let days = interactor.getNumberOfDays(per: tenant, for: bill)
                tenant.days = days
                let amountPerPerson = Double(tenant.days) * interactor.getCostPerDayPerPerson(for: tenants, for: bill)
                updateTenant(tenant: tenant, amount: amountPerPerson, days: days)
                total += amountPerPerson
                print("Cost per day: \(interactor.getCostPerDayPerPerson(for: tenants, for: bill))")
                print("Name: \(tenant.name), days: \(tenant.days) amount: \(amountPerPerson)")
            } else {
                updateTenant(tenant: tenant, amount: 0.0, days: 0)
            }
        }
        print("Total: \(total)")
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
                let realm = try! Realm()
                let theTenant = realm.objects(Tenant.self).filter("name == %@", tenant.name).first
                try! realm.write {
                    theTenant!.amount = amount
                    theTenant!.days = days
        }
    }
    
    
    
    func fetchBills() {
        self.bills.removeAll()
        let realm = try! Realm()
        let bills = realm.objects(Bill.self)
        for newBill in bills {
            let bill = Bill()
            bill.amount = newBill.amount
            bill.startDate = newBill.startDate
            bill.endDate = newBill.endDate
            self.bills.append(bill)
        }
        
    }
    
    
    
  @objc func addTapped() {
    let addBillVC = AddBillVC(nibName: "AddBillVC", bundle: nil)
    self.navigationController?.pushViewController(addBillVC, animated: true)
    }
    
}
