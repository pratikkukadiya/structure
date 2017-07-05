//
//  StringExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import Foundation

extension String {
    
    
    // GET TEXT LENGTH
    var length: Int {
        return self.characters.count
    }
    
    
    //GET CLASSNAME
    static func className(aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: "0").last!
    }
    
    
    func substring(from: Int) -> String {
        return self.substring(from: self.startIndex)
    }
    
    
    // REMOVE WHITESPACE FROM STRING
    func whiteSpaceTrimmedString() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
    
    
    //CHECK EMOJI
    func containsEmoji() -> Bool {
        for i in self.characters {
            if i.isEmoji() {
                return true
            }
        }
        return false
    }
    
    
    // SET LOCALIZED TEXT
    var localized: String {
         return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
   
    
}
