//
//  AddBillVC.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift
import RxCocoa
import RxSwift


class BillsVC: UIViewController {

    @IBOutlet weak var inDate: UIDatePicker!
    @IBOutlet weak var outDate: UIDatePicker!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var calculateInteractor = CalculateInteractor()
    var dataInteractor = DataInteractor()
    var tenants: [Tenant] = []
    var disposeBag = DisposeBag()
    var billsVM = BillsVM()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(saveTapped))
        setupTableView()
        reloadTableViewOnChanges()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.dataInteractor.fetchTenants (completion: { (tenants) in
            self.tenants = tenants
        })
        self.billsVM.fetchBills()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    
    func calculate(bill: Bill) {
        setupCurrentBill(newBill: bill)
        self.calculateInteractor.calculate(bill: bill) {
            DispatchQueue.main.async {
                self.tabBarController?.selectedIndex = 1
            }
        }
    }
    
    
    func setupCurrentBill(newBill: Bill) {
        DispatchQueue.main.async {
            autoreleasepool {
                // Reset isCurrent property for all bills
                let realm = try! Realm()
                let bills = realm.objects(Bill.self)
                realm.beginWrite()
                for bill in bills {
                    bill.isCurrent = false
                }
                // Set the current bill
                try! realm.commitWrite()
                realm.beginWrite()
                let newBill = realm.objects(Bill.self).filter("id == %@", newBill.id).first
                newBill?.isCurrent = true
                try! realm.commitWrite()
                self.billsVM.fetchBills()
            }
            
        }
    }
    
    
  @objc func addTapped() {
    let addBillVC = AddBillVC(nibName: AddBillVC.nibName, bundle: nil)
    self.navigationController?.pushViewController(addBillVC, animated: true)
    }
    
    
    @objc func saveTapped() {
        let mathInfoVC = MathInfoVC(nibName: MathInfoVC.nibName, bundle: nil)
        self.navigationController?.pushViewController(mathInfoVC, animated: true)
    }
    
    
    func reloadTableViewOnChanges() {
        billsVM.bills.asObservable().subscribe(onNext: { [weak self] posts in
            DispatchQueue.main.async {
                self?.showOrHidePlaceholder()
                self?.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    
    
    func showOrHidePlaceholder () {
        if billsVM.bills.value.isEmpty {
            Placeholder.share.show(placeholderView: self.tableView, text: Messages.noBillsPlaceholder)
        } else {
            Placeholder.share.hide()
            tableView.backgroundView = nil
        }
    }
    
}
