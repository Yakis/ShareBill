//
//  AddMateVC.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


protocol AddTenantDelegate: class {
    func didFinishAddingTenant(tenant: User)
}

class AddMateVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var moveInField: UITextField!
    @IBOutlet weak var moveOutField: UITextField!
    @IBOutlet weak var stillHereSwitch: UISwitch!
    
    
    var datePicker: UIDatePicker!
    var textField: UITextField!
    var user: User!
    weak var delegate: AddTenantDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveInField.delegate = self
        moveOutField.delegate = self
        stillHereSwitch.setOn(false, animated: true)
    }


    func pickUpDate(_ textField : UITextField){
        self.textField = textField
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
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
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(AddMateVC.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }
    
    
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        textField.text = dateFormatter1.string(from: datePicker.date)
        textField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        textField.resignFirstResponder()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(textField)
    }
    
    
    @IBAction func stillHereSwitchAction(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            let dateFormatter1 = DateFormatter()
            dateFormatter1.dateStyle = .medium
            dateFormatter1.timeStyle = .none
            let today = Date.init(timeIntervalSinceNow: 0)
            moveOutField.text = dateFormatter1.string(from: today)
            moveOutField.isEnabled = false
        default:
            moveOutField.isEnabled = true
        }
        
    }

    @IBAction func finishButtonAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        guard let nameString = nameField.text else {return}
        guard let moveInString = moveInField.text else {return}
        guard let moveOutString = moveOutField.text else {return}
        guard let inDate = dateFormatter.date(from: moveInString) else {return}
        guard let outDate = dateFormatter.date(from: moveOutString) else {return}
        self.user = User.init(name: nameString, inDate: inDate, outDate: outDate)
        delegate?.didFinishAddingTenant(tenant: user)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
