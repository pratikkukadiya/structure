//
//  UIFont.swift
//  ParkForU
//
//  Created by Binty Shah on 7/4/16.
//  Copyright © 2016 Binty Shah. All rights reserved.
//

import Foundation
import UIKit


//App Font names
struct AppFontName {
    
    static var Ubuntu_Regular       = "Ubuntu"
    static var Ubuntu_Light         = "Ubuntu-Light"
    static var Ubuntu_Bold          = "Ubuntu-Bold"
    static var Ubuntu_Medium        = "Ubuntu-Medium"
}


extension UIFont  {
    
   
    // SYSTEM FONT
    class func Font_System(_ fontSize : CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: PROPORTIONAL_FONT_SIZE(fontSize))
    }
    class func Font_Bold(_ fontSize : CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: PROPORTIONAL_FONT_SIZE(fontSize))
    }
    class func Font_Italic(_ fontSize : CGFloat) -> UIFont {
        return UIFont.italicSystemFont(ofSize: PROPORTIONAL_FONT_SIZE(fontSize))
    }
    
    
    // CUSTOM FONT
    class func Font_Ubuntu_Regular(_ fontSize : CGFloat) -> UIFont {
        return  Font(AppFontName.Ubuntu_Regular, fontSize)
    }
    class func Font_Ubuntu_Light(_ fontSize : CGFloat) -> UIFont {
        return  Font(AppFontName.Ubuntu_Light, fontSize)
    }
    class func Font_Ubuntu_Bold(_ fontSize : CGFloat) -> UIFont {
        return  Font(AppFontName.Ubuntu_Bold, fontSize)
    }
    class func Font_Ubuntu_Medium(_ fontSize : CGFloat) -> UIFont {
        return  Font(AppFontName.Ubuntu_Medium, fontSize)
    }
    
    
    // SET FONT SIZE
    class func Font(_ name : String , _ fontSize : CGFloat) -> UIFont {
        return UIFont(name: name, size: PROPORTIONAL_FONT_SIZE(fontSize))!
    }
    
    
    // PROPORTIONAL SIZES
   class func PROPORTIONAL_FONT_SIZE(_ fontSize : CGFloat) -> CGFloat {
        
        if IS_IPHONE_4_OR_4S()  {   return fontSize-3   }
        else if IS_IPHONE_5_OR_5S() {   return fontSize-2   }
        else if IS_IPHONE_6_OR_6S() {   return fontSize-1   }
        else if IS_IPHONE_6P_OR_6SP(){  return fontSize-0   }
        
        return fontSize
    }
    
}
