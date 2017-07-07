//
//  UIColor.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIColor {

    
    // SET RGB FROM HEX COLOR
    convenience init(hex: String) {
        self.init(hex: hex, alpha:1)
    }

    
    convenience init(hex: String, alpha: CGFloat) {
        var hexWithoutSymbol = hex
        if hexWithoutSymbol.hasPrefix("#") {
            hexWithoutSymbol = hex.substring(from: 1)
        }
        
        let scanner = Scanner(string: hexWithoutSymbol)
        var hexInt:UInt32 = 0x0
        scanner.scanHexInt32(&hexInt)
        
        var r:UInt32!, g:UInt32!, b:UInt32!
        switch (hexWithoutSymbol.length) {
        case 3: // #RGB
            r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
            g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
            b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
            break;
        case 6: // #RRGGBB
            r = (hexInt >> 16) & 0xff
            g = (hexInt >> 8) & 0xff
            b = hexInt & 0xff
            break;
        default:
            // TODO:ERROR
            break;
        }
        
        self.init(
            red: (CGFloat(r)/255),
            green: (CGFloat(g)/255),
            blue: (CGFloat(b)/255),
            alpha:alpha)
    }
    
    // RGB SORTCUT
    class func RGB( _ R:CGFloat, _ G:CGFloat, _ B:CGFloat, _ A:CGFloat) -> UIColor {
        return UIColor(red: R/255, green: G/255, blue: B/255, alpha: A)
    }
  
    
    
    // ALL APP COLORS
   
    //App Font names
    struct AppColor {
        static var color_NavigationBar      = UIColor.RGB(206, 32, 32, 1)
        static var color_AppRedColor        = UIColor.RGB(206, 32, 32, 1)
        static var color_AppGray            = UIColor.gray
        
      }
    
    
    
}
