//
//  TenantsListVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift




class TenantsListVC: UIViewController, AddTenantDelegate {
    
    

    
    
    @IBOutlet weak var tableView: UITableView!
    let dataInteractor = DataInteractor()
    let calculateInteractor = CalculateInteractor()
    
    
    var tenants = [Tenant]() {
        didSet {
            DispatchQueue.main.async {
                print("Refresh=== \(self.tenants.last?.name) \(self.tenants.last?.amount)")
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = Colors.maritimeOrange
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetTapped))
        navigationItem.leftBarButtonItem?.tintColor = Colors.maritimeOrange
        setupTableView()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dataInteractor.fetchTenants { (tenants) in
            for tenant in tenants {
                print("Tenant \(tenant.name) is still living here = \(tenant.stillLivingHere)")
            }
          self.tenants = tenants
        }
    }


    
    @objc func addTapped() {
        let addMateVC = AddMateVC(nibName: "AddMateVC", bundle: nil)
        addMateVC.delegate = self
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    
    
    @objc func resetTapped() {
        let realm = try! Realm()
        let tenants = realm.objects(Tenant.self)
        try! realm.write {
            for tenant in tenants {
            tenant.setValue(0.0, forKeyPath: "amount")
                tenant.setValue(0, forKeyPath: "days")
            }
            self.dataInteractor.fetchTenants(completion: { (tenants) in
                self.tenants = tenants
            })
        }
    }
    
    
    func didFinishAddingTenant() {
        calculate()
    }
    
    
    func calculate() {
        let realm = try! Realm()
        guard let bill = realm.objects(Bill.self).first else {return}
        self.calculateInteractor.calculate(bill: bill) { (tenants) in
                self.tenants = tenants
        }
    }
    

}
