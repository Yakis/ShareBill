//
//  AppController.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 17/09/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit

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
        tabBarController.tabBar.barTintColor = Colors.maritimeGray
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.backgroundColor = Colors.maritimeGray
        tabBarController.tabBar.tintColor = Colors.maritimeBlue
        tabBarController.tabBar.unselectedItemTintColor = Colors.maritimeGreen
        
        let addBillVC = BillsVC(nibName: "BillsVC", bundle: nil)
        let navAddBill = UINavigationController(rootViewController: addBillVC)
        navAddBill.navigationBar.topItem?.title = "Your Bills"
        addBillVC.tabBarItem = UITabBarItem(title: "Your Bills", image: UIImage(named: "BarcodeBW"), selectedImage: UIImage(named: "BarcodeRed"))

        let tenantsListVC = TenantsListVC(nibName: "TenantsListVC", bundle: nil)
        let navTenantsList = UINavigationController(rootViewController: tenantsListVC)
        navTenantsList.navigationBar.topItem?.title = "Tenants"
        tenantsListVC.tabBarItem = UITabBarItem(title: "Tenants", image: UIImage(named: "TenantsListBW"), selectedImage: UIImage(named: "TenantsListRed"))
        
        navAddBill.navigationBar.backgroundColor = Colors.maritimeGray
        navTenantsList.navigationBar.backgroundColor = Colors.maritimeGray
        navAddBill.navigationBar.barTintColor = Colors.maritimeGray
        navTenantsList.navigationBar.barTintColor = Colors.maritimeGray
        navAddBill.navigationBar.tintColor = Colors.maritimeBlue
        navTenantsList.navigationBar.tintColor = Colors.maritimeBlue

        let viewControllers = [navAddBill, navTenantsList]
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }

    
    
}
