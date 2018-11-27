//
//  ReportVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 16/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class MathInfoVC: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    
    @IBAction func getReportAction(_ sender: Any) {
        let reportVC = ReportVC(nibName: "ReportVC", bundle: nil)
        self.show(reportVC, sender: nil)
    }
    

}
