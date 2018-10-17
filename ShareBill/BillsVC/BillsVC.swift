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
    
    var calculateInteractor = CalculateInteractor()
    var dataInteractor = DataInteractor()
    var tenants: [Tenant] = []
    var bills: [Bill] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(saveTapped))
        setupTableView()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.tableFooterView = UIView(frame: .zero)
        self.dataInteractor.fetchTenants (completion: { (tenants) in
            self.tenants = tenants
        })
        fetchBills()
    }

    
    func calculate(bill: Bill) {
        self.calculateInteractor.calculate(bill: bill) { (tenants) in
            DispatchQueue.main.async {
                self.tabBarController?.selectedIndex = 1
            }
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
    
    
    @objc func saveTapped() {
        let mathInfoVC = MathInfoVC(nibName: "MathInfoVC", bundle: nil)
        self.navigationController?.pushViewController(mathInfoVC, animated: true)
    }
    
}
