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
        self.pickUpDate(textField)
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
    
    
    
    
    
    
}
