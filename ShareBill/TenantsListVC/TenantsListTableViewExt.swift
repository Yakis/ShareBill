//
//  TenantsListTableViewExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


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
        return 100
    }
    
    
    func setupTableView() {
        let nib = UINib(nibName: "TenantCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TenantCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
