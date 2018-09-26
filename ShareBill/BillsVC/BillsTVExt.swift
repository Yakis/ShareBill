//
//  BillsTVExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 24/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

extension BillsVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let billCell = tableView.dequeueReusableCell(withIdentifier: "BillCell", for: indexPath) as? BillCell {
            let bill = bills[indexPath.row]
            billCell.setup(with: bill)
            return billCell
        } else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let bill = bills[indexPath.row]
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { [weak self] (action, indexPath) in
            UserAlert.deleteConfirmation(vc: self!, message: "Are you sure you want to delete this bill?", completion: { [weak self] in
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(realm.objects(Bill.self).filter("amount=%@",bill.amount))
                    self?.fetchBills()
                }
            })
        }
        
        let calculate = UITableViewRowAction(style: .normal, title: "Calculate") { [weak self] (action, indexPath) in
            // calculate item at indexPath
            self?.calculate(bill: bill)
        }
        
        calculate.backgroundColor = Colors.maritimeGreen
        
        return [delete, calculate]
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    
    
    
    func setupTableView() {
        let nib = UINib(nibName: "BillCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BillCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}
