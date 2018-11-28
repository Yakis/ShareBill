//
//  PlaceholderView.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

class Placeholder {

    static var share = Placeholder()
    var label: UILabel!
    
    
    private init() {}
    
    func show(placeholderView: UITableView, text: String) {
        label = UILabel(frame: placeholderView.frame)
        label.textColor = Colors.maritimeOrange
        label.text = text
        label.textAlignment = .center
        label.numberOfLines = 0
        placeholderView.backgroundView = label
    }
    
    
    func hide () {
        self.label = nil
    }
    
}
