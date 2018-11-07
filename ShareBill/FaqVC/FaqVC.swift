//
//  FaqVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class FaqVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    let questions = [
                    "How do I read the meter?",
                    "Where is the meter located?",
                    "It will snow tommorow?",
                    "Dummy anwers...?"
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }


    

}
