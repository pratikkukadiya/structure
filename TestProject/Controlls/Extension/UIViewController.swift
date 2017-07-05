//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit


extension UIViewController {
    
    
    // MARK: ________________________ UINavigationBar Items ________________________
    // MARK:-
    
    
    //MARK: Add Left NavigationBar Button
    //MARK:-----
    func setLeftBarButtonImage(Name : String, selector : Selector) {
        
        if (self.navigationController != nil) {
            var barButton : UIBarButtonItem = UIBarButtonItem()
            barButton = UIBarButtonItem.init(image: UIImage(named: Name), style: .plain, target: self, action: selector)
            barButton.tintColor = UIColor.AppColor.color_NavigationBar
            self.navigationItem.leftBarButtonItem = barButton
        }
    }
    
    func setLeftBarButtonTitle(Name : String, selector : Selector) {
        
        if (self.navigationController != nil) {
            var barButton : UIBarButtonItem = UIBarButtonItem()
            barButton = UIBarButtonItem.init(title:Name.localized, style: UIBarButtonItemStyle.plain, target: self, action: selector)
            barButton.tintColor = UIColor.AppColor.color_NavigationBar
            self.navigationItem.leftBarButtonItem = barButton
        }
    }
    
    func setTwoLeftBarButtonImage(btn1Name : String , selector1 : Selector,btn2Name : String , selector2 : Selector) {
        
        if (self.navigationController != nil) {
            let btn_1 : UIBarButtonItem =  UIBarButtonItem(image: UIImage(named: btn1Name), style: .plain, target: self, action: selector1)
            let btn_2 : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: btn2Name), style: .plain, target: self, action: selector2)
            let buttons : NSArray = [btn_1, btn_2]
            self.navigationItem.leftBarButtonItems = buttons as? [UIBarButtonItem]
        }
    }
    
    
    //MARK: Add Right NavigationBar Button
    //MARK:------
    
    func setRightBarButtonImage(Name : String, selector : Selector) {
        
        if (self.navigationController != nil) {
            var barButton : UIBarButtonItem = UIBarButtonItem()
            barButton = UIBarButtonItem.init(image: UIImage(named: Name), style: .plain, target: self, action: selector)
            barButton.tintColor = UIColor.AppColor.color_AppRedColor
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    func setRightBarButtonTitle(Name : String, selector : Selector) {
        
        if (self.navigationController != nil) {
            var barButton : UIBarButtonItem = UIBarButtonItem()
            barButton = UIBarButtonItem.init(title:Name.localized, style: UIBarButtonItemStyle.plain, target: self, action: selector)
            barButton.tintColor = UIColor.AppColor.color_AppRedColor
            self.navigationItem.rightBarButtonItem = barButton
        }
    }
    
    func setTwoRightBarButtonImage(btn1Name : String , selector1 : Selector,btn2Name : String , selector2 : Selector) {
        
        if (self.navigationController != nil) {
            let btn_1 : UIBarButtonItem =  UIBarButtonItem(image: UIImage(named: btn1Name), style: .plain, target: self, action: selector1)
            let btn_2 : UIBarButtonItem = UIBarButtonItem(image: UIImage(named: btn2Name), style: .plain, target: self, action: selector2)
            let buttons : NSArray = [btn_1, btn_2]
            self.navigationItem.rightBarButtonItems = buttons as? [UIBarButtonItem]
        }
    }
    
    func setDefaultLeftSideButotnWithImage() {
        
        //self.setLeftBarButtonImage(Name: "menu", selector:#selector(self.presentLeftMenuViewController(_:)))
    }
    
    func setDefaultLeftSideButotnWithTitle() {
        
        //self.setLeftBarButtonTitle(Name: "left", selector:  #selector(self.presentLeftMenuViewController(_:)))
    }
   
    // MARK: - Public Actions
    // MARK: ------
    
    @IBAction public func presentLeftMenuViewController(sender: AnyObject) {
    //  self.sideMenuViewController!.presentLeftMenuViewController()
    }
    
    @IBAction public func presentRightMenuViewController(sender: AnyObject) {
    //  self.sideMenuViewController!.presentRightMenuViewController()
    }
    
    
    // MARK: ________________________ UITabBarController ________________________
    // MARK:-
    
    func setAppearanceOfTabBar(){
        self.tabBarController?.tabBar.isTranslucent = false
    }
    
    func removeTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
   
    
    // MARK: ________________________ UINavigationController ________________________
    // MARK:-
    
    func removeNavigationBarItem() {
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
    }
    
    func removeNavigationBar() {
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setAppearanceOfNavigationBar(){
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.green
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName: UIFont.systemFont(ofSize: 18.0)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        self.navigationController?.navigationBar.hideBottomHairline()
    }
    
    func setTranslucentOfNavigationBar(){
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    // Navigation Funcations
    
    func hideBottomLine() {
        self.navigationController?.navigationBar.hideBottomHairline()
    }
    
    func pushTo(_ popViewController:String) {

        self.navigationController?.pushTo(popViewController)

    }
    
    func popTo() {
        self.navigationController?.popTo()
    }
    
    func popToRoot() {
        self.navigationController?.popToRoot()
    }

    func popToViewController(_ viewController:String) {
        self.navigationController?.popToViewController(viewController)
        
    }
    func presentTo(_ viewController: String) {
        let VC1 = self.storyboard?.instantiateViewController(withIdentifier: viewController)
        let navController = UINavigationController(rootViewController: VC1!)
        self.present(navController, animated:true, completion: nil)
    }
    
    func dismissTo() {
        self.dismiss(animated: true, completion: {})
    }
    
    
    
    
}
