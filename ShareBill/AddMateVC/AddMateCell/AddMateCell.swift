//
//  AddMateCell.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 09/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AddMateCell: UITableViewCell {

   
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var moveInField: UITextField!
    @IBOutlet weak var moveOutField: UITextField!
    @IBOutlet weak var stillLivingHereSwitch: UISwitch!
    
    var addMateVM = AddMateVM()
    var disposeBag = DisposeBag()
    var currentTag: Int!
    var tenant: Tenant!
    var isEditingMode = false
    
    
    
    
    
    func setup(with tenant: Tenant?, isEditingMode: Bool) {
        self.isEditingMode = isEditingMode
        if isEditingMode {
            self.tenant = tenant
        }
        fillTheFieldsInEditingMode()
        dismissTheViewAfterSave()
        setupTextField()
    }
    
    
    
    
    
    @IBAction func stillLivingHereAction(_ sender: UISwitch) {
        switch sender.isOn {
        case true:
            let today = Date()
            moveOutField.text = today.shortDateString()
            moveOutField.isEnabled = false
        default:
            moveOutField.isEnabled = true
        }
    }
    
    
    @IBAction func finishButtonAction(_ sender: Any) {
        saveTenant()
    }
    
    
    
    
    
    func setDatePickerToTenantDate(picker: UIDatePicker) {
        if isEditingMode {
            switch currentTag {
            case 0:
                picker.date = tenant.inDate
            default:
                picker.date = tenant.outDate
            }
        }
    }
    
    
    func saveTenant() {
        guard let nameString = nameField.text, !nameString.isEmpty else {
            NotificationCenter.default.post(name: .alert, object: nil, userInfo: ["message": Messages.enterName])
            return
        }
        guard let moveInString = moveInField.text, !moveInString.isEmpty else {
            NotificationCenter.default.post(name: .alert, object: nil, userInfo: ["message": Messages.selectMovingInDate])
            return
        }
        guard let moveOutString = moveOutField.text, !moveOutString.isEmpty else {
            NotificationCenter.default.post(name: .alert, object: nil, userInfo: ["message": Messages.selectMovingOutDate])
            return
        }
        addMateVM.name = nameString
        addMateVM.moveInDate = moveInString
        addMateVM.moveOutDate = moveOutString
        addMateVM.stillLivingHere = stillLivingHereSwitch.isOn
        addMateVM.tenant = tenant
        switch isEditingMode {
        case true:
            addMateVM.updateTenant()
        default:
            addMateVM.saveTenant()
        }
        
    }
    
    
    func setTheSwitchToTenantStatus() {
        if tenant.stillLivingHere {
            stillLivingHereSwitch.setOn(true, animated: true)
        }
    }
    
    func fillTheFieldsInEditingMode() {
        if isEditingMode {
            self.nameField.text = tenant.name
            moveInField.text = tenant.inDate.shortDateString()
            moveOutField.text = tenant.outDate.shortDateString()
            setTheSwitchToTenantStatus()
        }
    }
    
    
    func setDatePickerToTenantDateInEditingMode(datePicker: UIDatePicker, textField: UITextField) {
        if isEditingMode {
            switch textField.tag {
            case 0: datePicker.date = tenant.inDate
            default: datePicker.date = tenant.outDate
            }
        }
    }
    
    
    func dismissTheViewAfterSave() {
        addMateVM.saveDone.asObservable().subscribe(onNext: { saveDone in
            if saveDone {
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .popToRootVC, object: nil)
                }
            }
        }).disposed(by: disposeBag)
    }
    
    
    
    
    
}
