//
//  AnswerVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class AnswerVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var answer: Answer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


   

}
