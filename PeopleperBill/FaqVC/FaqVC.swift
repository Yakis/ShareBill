//
//  FaqVC.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 17/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class FaqVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var answers = [Answer]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        FirebaseHelper.shared.getAnswers { [weak self] (answers) in
            self?.answers = answers
        }
    }


    

}
