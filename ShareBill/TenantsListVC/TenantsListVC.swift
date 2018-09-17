//
//  TenantsListVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit





class TenantsListVC: UIViewController, AddTenantDelegate {
    
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var users = [User]() {
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


    
    @objc func addTapped() {
        let addMateVC = AddMateVC(nibName: "AddMateVC", bundle: nil)
        addMateVC.delegate = self
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    
    
    func didFinishAddingTenant(tenant: User) {
        self.users.append(tenant)
    }

}
