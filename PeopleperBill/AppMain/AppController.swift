//
//  AppController.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit
import RealmSwift

class AppController: NSObject {
    
    
    class func launchDashboardIn(window: UIWindow) {
        window.rootViewController = self.createAndReturnRoot()
        window.makeKeyAndVisible()
    }
    
    class func createAndReturnRoot() -> UIViewController {
//        let addBillVC = AddBillVC(nibName: "AddBillVC", bundle: nil)
//        let navController = UINavigationController(rootViewController: addBillVC)
//        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navController.navigationBar.shadowImage = UIImage()
        return AppController.createAndReturnTabBarController()
    }
    
    
    class func createAndReturnTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = Colors.maritimeDark
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = Colors.maritimeDark
        tabBarController.tabBar.tintColor = Colors.maritimeOrange
        tabBarController.tabBar.unselectedItemTintColor = Colors.inactiveOrange
        
        let addBillVC = BillsVC(nibName: "BillsVC", bundle: nil)
        let navAddBill = UINavigationController(rootViewController: addBillVC)
        navAddBill.navigationBar.topItem?.title = "Your Bills"
        addBillVC.tabBarItem = UITabBarItem(title: "Your Bills", image: UIImage(named: "BarcodeBW"), selectedImage: UIImage(named: "BarcodeRed"))

        let tenantsListVC = TenantsListVC(nibName: "TenantsListVC", bundle: nil)
        let navTenantsList = UINavigationController(rootViewController: tenantsListVC)
        navTenantsList.navigationBar.topItem?.title = "Tenants"
        tenantsListVC.tabBarItem = UITabBarItem(title: "Tenants", image: UIImage(named: "TenantsListBW"), selectedImage: UIImage(named: "TenantsListRed"))
        
        let faqVC = FaqVC(nibName: "FaqVC", bundle: nil)
        let navFaq =  UINavigationController(rootViewController: faqVC)
        navFaq.navigationBar.topItem?.title = "FAQ"
        faqVC.tabBarItem = UITabBarItem(title: "FAQ", image: UIImage(named: "FaqBW"), selectedImage: UIImage(named: "FaqRed"))
        
        navAddBill.navigationBar.backgroundColor = Colors.maritimeDark
        navAddBill.navigationBar.barTintColor = Colors.maritimeDark
        navAddBill.navigationBar.tintColor = Colors.maritimeOrange
        navAddBill.navigationBar.isTranslucent = false
        
        navTenantsList.navigationBar.backgroundColor = Colors.maritimeDark
        navTenantsList.navigationBar.barTintColor = Colors.maritimeDark
        navTenantsList.navigationBar.tintColor = Colors.maritimeOrange
        navTenantsList.navigationBar.isTranslucent = false
        
        navFaq.navigationBar.backgroundColor = Colors.maritimeDark
        navFaq.navigationBar.barTintColor = Colors.maritimeDark
        navFaq.navigationBar.tintColor = Colors.maritimeOrange
        navFaq.navigationBar.isTranslucent = false

        let viewControllers = [navAddBill, navTenantsList, navFaq]
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }

    
    
    
    
    class func setStillLivingHereDate() {
        let realm = try! Realm()
        let tenants = realm.objects(Tenant.self)
        try! realm.write {
            for tenant in tenants {
                if tenant.stillLivingHere {
                    let currentDate = Date(timeIntervalSinceNow: 0)
                tenant.setValue(currentDate, forKeyPath: "outDate")
                }
            }
            }
    }
    
    
}
