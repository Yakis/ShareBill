//
//  AddMateVC.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift


class AddMateVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var tenant: Tenant!
    var isEditingMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(alert(notification:)), name: .alert, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(popToRootVC(notification:)), name: .popToRootVC, object: nil)
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
