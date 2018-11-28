//
//  AddMateVM.swift
//  People per bill
//
//  Created by Mugurel Moscaliuc on 19/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

struct AddMateVM {
    
    let dataInteractor = DataInteractor()
    
    var name: String?
    var moveInDate: String?
    var moveOutDate: String?
    var stillLivingHere: Bool?
    var tenant: Tenant!
    var saveDone = BehaviorRelay(value: false)
    
    
    private var _name: String {
        guard let name = name else {return ""}
        return name
    }
    
    private var _moveInDate: Date {
        guard let moveInDate = moveInDate?.toDate() else {return Date()}
        return moveInDate
    }
    
    private var _moveOutDate: Date {
        guard let moveOutDate = moveOutDate?.toDate() else {return Date()}
        return moveOutDate
    }
    
    private var _stillLivingHere: Bool {
        guard let stillLivingHere = stillLivingHere else {return false}
        return stillLivingHere
    }
    
    
    
    func saveTenant() {
        let newTenant = Tenant()
        newTenant.name = _name
        newTenant.inDate = _moveInDate
        newTenant.outDate = _moveOutDate
        newTenant.stillLivingHere = _stillLivingHere
        newTenant.id = UUID().uuidString
        dataInteractor.save(tenant: newTenant) {
            saveDone.accept(true)
        }
    }
    
    func updateTenant() {
        tenant.name = _name
        tenant.inDate = _moveInDate
        tenant.outDate = _moveOutDate
        tenant.stillLivingHere = _stillLivingHere
        tenant.id = tenant.id
        dataInteractor.update(with: tenant) {
            saveDone.accept(true)
        }
    }
    
    
    
    
}
