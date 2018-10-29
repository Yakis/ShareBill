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
        return tenantsListVM.tenants.value.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TenantCell", for: indexPath) as? TenantCell {
            let tenant = tenantsListVM.tenants.value[indexPath.row]
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
        let tenant = tenantsListVM.tenants.value[indexPath.row]
        UserAlert.deleteConfirmation(vc: self, message: "Are you sure you want to delete this user?") { [weak self] in
           self?.tenantsListVM.delete(tenant: tenant)
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addMateVC = AddMateVC(nibName: "AddMateVC", bundle: nil)
        let tenant = tenantsListVM.tenants.value[indexPath.row]
        addMateVC.isEditingMode = true
        addMateVC.tenant = tenant
        addMateVC.delegate = self
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    
    
    
    
    
    func setupTableView() {
        let nib = UINib(nibName: TenantCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TenantCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
