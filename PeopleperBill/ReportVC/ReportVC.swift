//
//  ReportVC.swift
//  People per bill
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
        // createReport()
    }

    
    
    func createReport() {
        var stringReport = ""
        let realm = try! Realm()
        guard let bill = realm.objects(Bill.self).last else {return}
        let tenants = realm.objects(Tenant.self)
        let startDate = bill.startDate.shortDateString()
        let endDate = bill.endDate.shortDateString()
        let billDetails = "Bill amount: £\(bill.amount)\nBill interval: \(startDate) - \(endDate)\n----------------------------------------"
        stringReport = billDetails
        for tenant in tenants {
            var outDate = ""
            if tenant.stillLivingHere {
                outDate = "<Still living here>"
            } else {
                outDate = "\(tenant.outDate.shortDateString())"
            }
            stringReport.append("\n\(tenant.name) \nAmount: \(tenant.amount.roundToDecimal(2)) \nMoved in: \(tenant.inDate.shortDateString()) \nMoved out: \(outDate) \nDays: \(tenant.days)\n----------------------------------------")
        }
        detailedReportTextView.text = stringReport
        shareText(text: stringReport)
    }

    
    
    
    func shareText(text: String) {
            let vc = UIActivityViewController(activityItems: [text], applicationActivities: nil)
            vc.popoverPresentationController?.sourceView = self.view
            self.present(vc, animated: true)
    }

}
