//
//  AddBillTextFieldExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 29/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


extension AddBillVC: UITextFieldDelegate {
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePicker = DatePicker.shared
        datePicker.frame = self.view.frame
        datePicker.pickUpDate(textField)
        guard let observer = datePicker.observer else {return}
        observer.takeLast(1).bind { (textField) in
            switch textField.tag {
            case 0: self.startDateTextField = textField
            default: self.endDateTextField = textField
            }
        }
    }
    
    
    
    
    
    
    
    
}
