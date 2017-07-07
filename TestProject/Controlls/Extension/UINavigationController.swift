//
//  UIApplication.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/11/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//
import UIKit

extension UINavigationController {
    
   
    // Push To Any ViewController
    override func pushTo(_ viewController:String) {
   
        self.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: viewController))!, animated: true)
        
        
    }
    
    
    // Pop To last ViewController
    override func popTo() {
    
        self.popViewController(animated: true)
    }
    
    
    // Pop To Any ViewController drom queq
     override func popToViewController(_ viewController:String) {
   
        self.navigationController?.popToViewController((self.storyboard?.instantiateViewController(withIdentifier: viewController))!, animated: true)
        
//        let controllers = self.navigationController?.viewControllers
//        for vc in controllers! {
//            if (vc is UIViewController ) {
//                _ = self.navigationController?.popToViewController(vc as! ViewController, animated: true)
//            }
//        }

        
        
    }

    
    // Pop To Last ViewController
    override func popToRoot() {
   
        self.popToRootViewController(animated: true)
    }
    
    
    // Present Any ViewController
    override func presentTo(_ viewController: String) {
        
        let VC1 = self.storyboard?.instantiateViewController(withIdentifier: viewController)
        let navController = UINavigationController(rootViewController: VC1!)
        self.present(navController, animated:true, completion: nil)
    }
    
    // dismiss ViewController
    override func dismissTo() {
        
        self.dismiss(animated: true, completion: {})
    }
    
    
    
    
    
}
