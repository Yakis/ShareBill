//
//  AddMateTextFieldExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 30/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

extension AddMateVC: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = DatePicker.shared
        datePicker.frame = self.view.frame
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
    
    
}
