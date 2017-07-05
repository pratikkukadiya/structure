//
//  UIApplication.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/11/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//
import UIKit

extension UINavigationBar {
    
    //MARK:- UINavigationBar EXTENSIONS
    //MARK:-
    
    // Hide line under navigation bar
    func hideBottomHairline() {
        
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        if navigationBarImageView != nil{
            navigationBarImageView!.isHidden = true
        }
    }
    
  
    // Show line under navigation bar
    func showBottomHairline() {
        
        let navigationBarImageView = hairlineImageViewInNavigationBar(self)
        navigationBarImageView!.isHidden = false
    
    }
    
    
    // Add View as navigationbar bottom line
    private func hairlineImageViewInNavigationBar(_ view: UIView) -> UIImageView? {
        if view.isKind(of: UIImageView.self) && view.bounds.height <= 1.0 {
             return (view as! UIImageView)
        }
        
        let subviews = (view.subviews as [UIView])
        for subview: UIView in subviews {
            if let imageView: UIImageView = hairlineImageViewInNavigationBar(subview) {
                return imageView
            }
        }
        
        return nil
    }
    
}
