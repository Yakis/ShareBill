//
//  DatePicker.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 30/10/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class DatePicker: NSObject {
    
    
    var datePicker: UIDatePicker!
    var currentTextField: UITextField!
    var observer: Observable<UITextField>!
    var frame: CGRect!
    
    
    static let shared = DatePicker()
    
    private override init() {}
    
    
     func pickUpDate(_ textField: UITextField){
        self.currentTextField = textField
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.frame.size.width, height: 216))
        self.datePicker.backgroundColor = Colors.maritimeDark
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        self.datePicker.datePickerMode = UIDatePicker.Mode.date
        currentTextField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        doneButton.tintColor = Colors.maritimeOrange
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        cancelButton.tintColor = Colors.maritimeOrange
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = Colors.maritimeDark
        currentTextField.inputAccessoryView = toolBar
        
    }
    
    
     @objc func doneClick() {
            currentTextField.text = datePicker.date.shortDateString()
        setObserver()
            currentTextField.resignFirstResponder()
    }
    
    @objc func cancelClick() {
            currentTextField.resignFirstResponder()
    }
    
    
    func setObserver() {
        observer = Observable.create ({ [weak self] observer in
            guard let textField = self?.currentTextField else {
                return Disposables.create {
                    observer.onError(RxError.unknown)
                }
            }
            observer.onNext(textField)
            observer.onCompleted()
            return Disposables.create {}
        })
    }
    
    
    
}
