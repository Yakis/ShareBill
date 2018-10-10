//
//  AddBillVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 21/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

class AddBillVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    var datePicker: UIDatePicker!
    var currentTag: Int!
    var bill: Bill!
    var isEditingMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTheFieldsInEditingMode()
        startDateTextField.delegate = self
        endDateTextField.delegate = self
        startDateTextField.tag = 0
        endDateTextField.tag = 1
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    
    func pickUpDate(_ textField : UITextField){
        self.currentTag = textField.tag
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = Colors.maritimeDark
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddMateVC.doneClick))
        doneButton.tintColor = Colors.maritimeOrange
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddMateVC.cancelClick))
        cancelButton.tintColor = Colors.maritimeOrange
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = Colors.maritimeDark
        textField.inputAccessoryView = toolBar
        
    }
    
    
    @objc func doneClick() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        if currentTag == 0 {
            startDateTextField.text = dateFormatter.string(from: datePicker.date)
            startDateTextField.resignFirstResponder()
        } else {
            endDateTextField.text = dateFormatter.string(from: datePicker.date)
            endDateTextField.resignFirstResponder()
        }
    }
    
    @objc func cancelClick() {
        if currentTag == 0 {
            startDateTextField.resignFirstResponder()
        } else {
            endDateTextField.resignFirstResponder()
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(textField)
    }


    @IBAction func doneButtonAction(_ sender: Any) {
        switch isEditingMode {
        case true:
            updateBill()
        default:
            saveBill()
        }
    }
    
    func saveBill() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        guard let amount = amountTextField.text?.toDouble() else {return}
        guard let startDateString = startDateTextField.text else {return}
        guard let endDateString = endDateTextField.text else {return}
        guard let startDate = dateFormatter.date(from: startDateString) else {return}
        guard let endDate = dateFormatter.date(from: endDateString) else {return}
        self.bill = Bill()
        bill.amount = amount
        bill.startDate = startDate
        bill.endDate = endDate
        let realm = try! Realm()
        try! realm.write {
            realm.add(bill)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    
    func updateBill() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let realm = try! Realm()
        let theBill = realm.objects(Bill.self).filter("amount == %@", bill.amount).first
        guard let amount = amountTextField.text?.toDouble() else {return}
        guard let startDateString = startDateTextField.text else {return}
        guard let endDateString = endDateTextField.text else {return}
        guard let startDate = dateFormatter.date(from: startDateString) else {return}
        guard let endDate = dateFormatter.date(from: endDateString) else {return}
        try! realm.write {
            theBill?.amount = amount
            theBill?.startDate = startDate
            theBill?.endDate = endDate
        }
        navigationController?.popToRootViewController(animated: true)
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

}
