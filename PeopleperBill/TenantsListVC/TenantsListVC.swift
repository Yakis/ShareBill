//
//  TenantsListVC.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa



class TenantsListVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let calculateInteractor = CalculateInteractor()
    var tenantsListVM = TenantsListVM()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtons()
        setupTableView()
        reloadTableViewOnChanges()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tenantsListVM.fetchTenants()
        tenantsListVM.calculate()
    }

    
    @objc func addTapped() {
        let addMateVC = AddMateVC(nibName: AddMateVC.nibName, bundle: nil)
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    
    
    @objc func resetTapped() {
        tenantsListVM.resetAmounts()
    }
    
    
    func reloadTableViewOnChanges() {
        tenantsListVM.tenants.asObservable().subscribe(onNext: { [weak self] _ in
            DispatchQueue.main.async {
                self?.showOrHidePlaceholder()
                self?.tableView.reloadData()
            }
        }).disposed(by: disposeBag)
    }
    
    
    func setupBarButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem?.tintColor = Colors.maritimeOrange
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetTapped))
        navigationItem.leftBarButtonItem?.tintColor = Colors.maritimeOrange
    }

    
    func showOrHidePlaceholder () {
        if tenantsListVM.tenants.value.isEmpty {
            Placeholder.share.show(placeholderView: self.tableView, text: Messages.noTenantsPlaceholder)
        } else {
            Placeholder.share.hide()
            tableView.backgroundView = nil
        }
    }


}
