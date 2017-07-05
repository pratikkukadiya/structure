//
//  UIView.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit
import CoreMotion

let AMPLITUDE = 20
let LIMIT_ANGLE = 2

extension UIView {
    
    
    class func loadNib<T: UIView>(viewType: T.Type) -> T {
        let className = String.className(aClass: viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(viewType: self)
    }
    
    func setShadowView(_ width:CGFloat=0.2, height:CGFloat=0.2, Opacidade:Float=0.7, maskToBounds:Bool=false, radius:CGFloat=0.5){
        /*.. Set shadow  */
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: width, height: height)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = Opacidade
        self.layer.masksToBounds = maskToBounds
    }
    
    func setCornerradius(_ radius:CGFloat){
        /*.. Set cornerradius  */
        self.layer.cornerRadius = radius
        self.clipsToBounds = true 
    }
    
    func setFrameBorder(_ color:UIColor , width:CGFloat)  {
        /*.. Set border  */
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        
    }
    
    func setBluarView() {
        /*.. Set blur view  */
        let toolbar : UIToolbar = UIToolbar()
        toolbar.frame = self.frame
        toolbar.backgroundColor = UIColor.black
        toolbar.alpha = 0.55
        self.addSubview(toolbar)
   
    }
  
    func setUpperShadow(_ radius: CGFloat) {
        /*.. Set upper side shadow  */
        let viewlayer1 = self.layer
        viewlayer1.shadowOffset = CGSize(width: 0, height: -self.frame.height)
        viewlayer1.shadowColor = UIColor.gray.cgColor
        viewlayer1.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        viewlayer1.shadowRadius = radius
        viewlayer1.shadowOpacity = 1.0
    }
 
    func setBottomShadow(_ radius: CGFloat) {
        /*.. Set bottom shadow  */
        let viewlayer1 = self.layer
        viewlayer1.shadowOffset = CGSize(width: 0, height: self.frame.height)
        viewlayer1.shadowColor = UIColor.black.cgColor
        viewlayer1.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        viewlayer1.shadowRadius = radius
        viewlayer1.shadowOpacity = 1.0
    }
    
   
    
    
}
