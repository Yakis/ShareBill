//
//  TenantsListVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class TenantsListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }


    
    @objc func addTapped() {
        let addMateVC = AddMateVC(nibName: "AddMateVC", bundle: nil)
        self.navigationController?.pushViewController(addMateVC, animated: true)
    }
    

}
