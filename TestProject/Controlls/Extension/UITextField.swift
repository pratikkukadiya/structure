//
//  UIApplication.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/11/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//
import UIKit

extension UITextField {
    
    
    override open func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if action == #selector(self.paste) {
            return false
        }
        else if action == #selector(self.select) {
            return false
        }
        else if action == #selector(self.selectAll) {
            return false
        }
        else if action == #selector(self.copy(_:)) {
            return false
        }
        else if action == #selector(self.cut(_:)) {
            return false
        }
        else if action == #selector(self.delete(_:)) {
            return false
        }
        else{
            return false
        }
        
    }

   
}
