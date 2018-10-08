//
//  TenantsListTableViewExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

extension TenantsListVC: UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tenants.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TenantCell", for: indexPath) as? TenantCell {
            let tenant = tenants[indexPath.row]
            cell.setup(with: tenant)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let tenant = tenants[indexPath.row]
        let realm = try! Realm()
        UserAlert.deleteConfirmation(vc: self, message: "Are you sure you want to delete this user?") {
            try! realm.write {
                realm.delete(realm.objects(Tenant.self).filter("name=%@",tenant.name))
                self.tenants = self.dataInteractor.fetchTenants()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addMateVC = AddMateVC(nibName: "AddMateVC", bundle: nil)
        let tenant = tenants[indexPath.row]
        addMateVC.isEditingMode = true
        addMateVC.tenant = tenant
        addMateVC.delegate = self
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    
    
    func setupTableView() {
        let nib = UINib(nibName: "TenantCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TenantCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
