//
//  AddMateTextFieldExt.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 30/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

extension AddMateCell: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = DatePicker.shared
        datePicker.frame = self.frame
        datePicker.pickUpDate(textField)
        setDatePickerToTenantDateInEditingMode(datePicker: datePicker.datePicker, textField: textField)
        guard let observer = datePicker.observer else {return}
        let _ = observer.takeLast(1).bind { (textField) in
            switch textField.tag {
            case 0: self.moveInField = textField
            default: self.moveOutField = textField
            }
        }
    }
    
    
    func setupTextField() {
        moveInField.delegate = self
        moveOutField.delegate = self
        stillLivingHereSwitch.setOn(false, animated: true)
        moveInField.tag = 0
        moveOutField.tag = 1
        stillLivingHereSwitch.onTintColor = Colors.maritimeBlue
        fillTheFieldsInEditingMode()
    }
    
}
