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
    
    
    var tenants = [Tenant]() {
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
        fetchTenants()
    }


    
    @objc func addTapped() {
        let addMateVC = AddMateVC(nibName: "AddMateVC", bundle: nil)
        addMateVC.delegate = self
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    
    
    func didFinishAddingTenant() {
        fetchTenants()
        
    }
    
    
    func fetchTenants() {
        self.tenants.removeAll()
        let realm = try! Realm()
        let tenants = realm.objects(Tenant.self)
        for newTenant in tenants {
            let tenant = Tenant()
            print("------------TENANTS LIST------------")
            print(newTenant.name)
            tenant.name = newTenant.name
            tenant.inDate = newTenant.inDate
            tenant.outDate = newTenant.outDate
            self.tenants.append(tenant)
        }
    }

}
