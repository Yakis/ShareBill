//
//  Alerts.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 25/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit


class UserAlert {
    
    
    static func deleteConfirmation(vc: UIViewController, message: String, completion: @escaping () -> () ) {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            alertController.dismiss(animated: true, completion: nil)
        }
        
        let delete = UIAlertAction(title: "Delete", style: .destructive) { (action:UIAlertAction) in
            completion()
        }
        alertController.addAction(cancel)
        alertController.addAction(delete)
        vc.present(alertController, animated: true, completion: nil)
    }
}
