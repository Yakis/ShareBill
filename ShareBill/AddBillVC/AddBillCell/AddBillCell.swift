//
//  AddBillCell.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 08/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AddBillCell: UITableViewCell {

    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    
    
    var addBillVM = AddBillVM()
    var disposeBag = DisposeBag()
    var currentTag: Int!
    var bill: Bill!
    var isEditingMode = false
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupWith(bill: Bill?, isEditingMode: Bool) {
        self.isEditingMode = isEditingMode
        if isEditingMode {
        self.bill = bill
        }
        fillTheFieldsInEditingMode()
        dismissTheViewAfterSave()
        setupTextField()
    }
    

   
    @IBAction func doneButtonAction(_ sender: Any) {
        saveBill()
    }
    
    
    func saveBill() {
        guard let amount = amountTextField.text, !amount.isEmpty else {
            NotificationCenter.default.post(name: .alert, object: nil, userInfo: ["message": Messages.enterAmount])
            return
        }
        guard let startDateString = startDateTextField.text, !startDateString.isEmpty else {
            NotificationCenter.default.post(name: .alert, object: nil, userInfo: ["message": Messages.selectStartingDate])
            return
        }
        guard let endDateString = endDateTextField.text, !endDateString.isEmpty else {
            NotificationCenter.default.post(name: .alert, object: nil, userInfo: ["message": Messages.selectEndDate])
            return
        }
        addBillVM.amount = amount
        addBillVM.startDate = startDateString
        addBillVM.endDate = endDateString
        addBillVM.bill = bill
        switch isEditingMode {
        case true:
            addBillVM.updateBill()
        default:
            addBillVM.saveBill()
        }
        
    }
    
    
    func dismissTheViewAfterSave() {
        addBillVM.saveDone.asObservable().subscribe(onNext: { saveDone in
            if saveDone {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .popToRootVC, object: nil)
                }
            }
        }).disposed(by: disposeBag)
    }
    
    
    func fillTheFieldsInEditingMode() {
        if isEditingMode {
            self.amountTextField.text = String(bill.amount)
            self.startDateTextField.text = bill.startDate.shortDateString()
            self.endDateTextField.text = bill.endDate.shortDateString()
        }
    }
    
    
    func setDatePickerToBillDateInEditingMode(datePicker: UIDatePicker, textField: UITextField) {
        if isEditingMode {
            switch textField.tag {
            case 0: datePicker.date = bill.startDate
            default: datePicker.date = bill.endDate
            }
        }
    }
    
    
    
    
    
}
