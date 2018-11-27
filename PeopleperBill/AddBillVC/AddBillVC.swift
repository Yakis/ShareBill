//
//  AddBillVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 21/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class AddBillVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var bill: Bill!
    var isEditingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .alert, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(popToRootVC(notification:)), name: .popToRootVC, object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
    @objc func alert(notification: NSNotification) {
        guard let message = notification.userInfo?["message"] as? String else {return}
        UserAlert.showInfo(vc: self, message: message)
    }
    
    
    
    @objc func popToRootVC(notification: Notification) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
