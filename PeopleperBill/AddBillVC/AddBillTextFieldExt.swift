//
//  AddBillTextFieldExt.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 29/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension AddBillCell: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = DatePicker.shared
        datePicker.frame = self.frame
        datePicker.pickUpDate(textField)
        setDatePickerToBillDateInEditingMode(datePicker: datePicker.datePicker, textField: textField)
        guard let observer = datePicker.observer else {return}
        let _ = observer.takeLast(1).bind { (textField) in
            switch textField.tag {
            case 0: self.startDateTextField = textField
            default: self.endDateTextField = textField
            }
        }
    }
    
    
    func setupTextField() {
        startDateTextField.delegate = self
        endDateTextField.delegate = self
        startDateTextField.tag = 0
        endDateTextField.tag = 1
    }
    
    
}
