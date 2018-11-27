//
//  AddBillTvExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 08/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit



extension AddBillVC: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AddBillCell.nibName, for: indexPath) as? AddBillCell {
                cell.setupWith(bill: bill, isEditingMode: isEditingMode)
                return cell
            }
        default:
            let cell = UITableViewCell()
            cell.backgroundColor = Colors.maritimeDark
            return cell
        }
        return UITableViewCell()
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UITableView.automaticDimension
        default:
            return 300
        }
    }
    
    func setupTableView() {
        let nib = UINib(nibName: AddBillCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: AddBillCell.nibName)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    
    
}
