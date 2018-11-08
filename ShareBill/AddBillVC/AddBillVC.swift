//
//  AddBillVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 21/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift
import RxCocoa

class AddBillVC: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    
    var addBillVM = AddBillVM()
    var disposeBag = DisposeBag()
    var currentTag: Int!
    var bill: Bill!
    var isEditingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTheFieldsInEditingMode()
        dismissTheViewAfterSave()
        startDateTextField.delegate = self
        endDateTextField.delegate = self
        startDateTextField.tag = 0
        endDateTextField.tag = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    

    @IBAction func doneButtonAction(_ sender: Any) {
        saveBill()
    }
    
    
    func saveBill() {
        guard let amount = amountTextField.text, !amount.isEmpty else {
            UserAlert.showInfo(vc: self, message: Messages.enterAmount)
            return
        }
        guard let startDateString = startDateTextField.text, !startDateString.isEmpty else {
             UserAlert.showInfo(vc: self, message: Messages.selectStartingDate)
            return
        }
        guard let endDateString = endDateTextField.text, !endDateString.isEmpty else {
            UserAlert.showInfo(vc: self, message: Messages.selectEndDate)
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
        addBillVM.saveDone.asObservable().subscribe(onNext: { [weak self] saveDone in
            if saveDone {
                DispatchQueue.main.async {
                    self?.navigationController?.popToRootViewController(animated: true)
                }
            }
        }).disposed(by: disposeBag)
    }
    
    
    func fillTheFieldsInEditingMode() {
        if isEditingMode {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            self.amountTextField.text = String(bill.amount)
            self.startDateTextField.text = dateFormatter.string(from: bill.startDate)
            self.endDateTextField.text = dateFormatter.string(from: bill.endDate)
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
