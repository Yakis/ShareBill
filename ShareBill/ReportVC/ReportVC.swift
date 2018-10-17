//
//  ReportVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 16/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

class ReportVC: UIViewController {
    
    
    @IBOutlet weak var detailedReportTextView: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createReport()
    }

    
    
    func createReport() {
        var stringReport = ""
        let realm = try! Realm()
        guard let bill = realm.objects(Bill.self).last else {return}
        let tenants = realm.objects(Tenant.self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let startDate = dateFormatter.string(from: bill.startDate)
        let endDate = dateFormatter.string(from: bill.endDate)
        let billDetails = "Bill amount: £\(bill.amount)\nBill interval: \(startDate) - \(endDate)\n----------------------------------------"
        stringReport = billDetails
        for tenant in tenants {
            stringReport.append("\n\(tenant.name) - days: \(tenant.days), amount: \(tenant.amount.roundToDecimal(2))\n----------------------------------------")
        }
        detailedReportTextView.text = stringReport
        shareImage()
    }

    
    
    
    func shareImage() {
        let image = self.view.asImage()
            let vc = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true)
    }

}
