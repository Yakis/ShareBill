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
        print(interactor.getCostPerDayPerPerson(for: tenants, for: bill))
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
