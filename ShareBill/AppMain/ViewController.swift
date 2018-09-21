//
//  ViewController.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 16/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstPicker: UIDatePicker!
    @IBOutlet weak var secondPicker: UIDatePicker!
    @IBOutlet weak var numberOfDaysLabel: UILabel!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func calculateButtonAction(_ sender: Any) {
        let firstDate = firstPicker.date
        let secondDate = secondPicker.date
        let diff = secondDate.interval(ofComponent: .day, fromDate: firstDate)
        numberOfDaysLabel.text = "Total: \(diff) days."
    }
    

    
    
    @IBAction func scanButtonAction(_ sender: Any) {
        let scannerVC = ScannerViewController()
        self.show(scannerVC, sender: nil)
       // self.present(scannerVC, animated: true, completion: nil)
    }
    
    
    
    
    
}


