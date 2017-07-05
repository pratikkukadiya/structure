//
//  Extensions.swift
//  Spotliss
//
//  Created by Govind ravaliya on 07/07/16.
//  Copyright © 2016 Govind ravaliya. All rights reserved.
//

import Foundation
import UIKit



//MARK: - CGFLOAT EXTENSIONS
//MARK: -

extension CGFloat{
    
    
    func proportionalFontSize() -> CGFloat {
        //for getting font size according to device
        
        var sizeToCheckAgainst = self
        
        if(IS_IPAD_DEVICE())	{
            sizeToCheckAgainst += 12
        }
        else {
            if(IS_IPHONE_6P_OR_6SP()) {
                sizeToCheckAgainst += 1
            }
            else if(IS_IPHONE_6_OR_6S()) {
                sizeToCheckAgainst -= 0
            }
            else if(IS_IPHONE_5_OR_5S()) {
                sizeToCheckAgainst -= 3
            }
            else if(IS_IPHONE_4_OR_4S()) {
                sizeToCheckAgainst -= 3
            }
        }
        return sizeToCheckAgainst
    }

}


//MARK: - NSBundle EXTENSIONS
//MARK: -
extension Bundle {
    
    var releaseVersionNumber: String! {
        return self.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    var buildVersionNumber: String {
        return self.infoDictionary?["CFBundleVersion"] as! String
    }
    
    var appName: String {
        return self.infoDictionary?["CFBundleName"] as! String
    }
}


//MARK: - Character EXTENSIONS
//MARK: -
extension Character {
    func isEmoji() -> Bool {
      
        return (Character(UnicodeScalar(0x1d000)!) <= self && Character(UnicodeScalar(0x1f77f)!) >= self) || (Character(UnicodeScalar(0x1f900)!) <= self && Character(UnicodeScalar(0x1f9ff)!) >= self) || (Character(UnicodeScalar(0x2100)!) <= self && Character(UnicodeScalar(0x26ff)!) >= self)
    }
}



//MARK: - NSDictionary EXTENSIONS
//MARK: -
extension NSDictionary{
    
    func object_forKeyWithValidationForClass_Int(aKey: String) -> Int {
        
        // CHECK FOR EMPTY
        if(self.allKeys.count == 0) {
            return Int()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return Int()
            }
        } else {
            // KEY NOT FOUND
            return Int()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return Int()
        }
        else {
            return self.object(forKey: aKey) as! Int
        }
    }
    
    func object_forKeyWithValidationForClass_CGFloat(aKey: String) -> CGFloat {
        
        // CHECK FOR EMPTY
        if(self.allKeys.count == 0) {
            return CGFloat()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return CGFloat()
            }
            else if(val as! String == "") {
                return 0.00
            }
        } else {
            // KEY NOT FOUND
            return CGFloat()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return CGFloat()
        }
        else {
            return self.object(forKey: aKey) as! CGFloat
        }
    }
    
    func object_forKeyWithValidationForClass_String(aKey: String) -> String {
        
        //        // CHECK FOR EMPTY
        //        if(self.allKeys.count == 0) {
        //            return String()
        //        }
        //
        //        // CHECK IF KEY EXIST
        //        if let val = self.objectForKey(aKey) {
        //            if(val.isEqual(NSNull())) {
        //                return String()
        //            }
        //        } else {
        //            // KEY NOT FOUND
        //            return String()
        //        }
        //
        //        // CHECK FOR NIL VALUE
        //        let aValue : AnyObject = self.objectForKey(aKey)!
        //        if aValue.isEqual(NSNull()) {
        //            return String()
        //        }
        //        else {
        //            //			return self.objectForKey(aKey) as! String
        //            return "\(self.valueForKey(aKey))"
        //        }
        
        
        // CHECK FOR EMPTY
        
        if(self.allKeys.count == 0) {
            return String()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return String()
            }
        } else {
            // KEY NOT FOUND
            return String()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
        
            return String()
        }
        else {
            
            if aValue is String {
                return self.object(forKey: aKey) as! String
            }
            else{
                return String()
            }
            
            //			return self.objectForKey(aKey) as! String
        }
        
    }
 
    func object_forKeyWithValidationForClass_Bool(aKey: String) -> Bool {
        // CHECK FOR EMPTY
        if(self.allKeys.count == 0) {
            return Bool()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return Bool()
            }
        } else {
            // KEY NOT FOUND
            return Bool()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return Bool()
        }
        else {
            return self.object(forKey: aKey) as! Bool
        }
    }
    
    func object_forKeyWithValidationForClass_NSArray(aKey: String) -> NSArray {
        // CHECK FOR EMPTY
        if(self.allKeys.count == 0) {
            return NSArray()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return NSArray()
            }
        } else {
            // KEY NOT FOUND
            return NSArray()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return NSArray()
        }
        else {
            return self.object(forKey: aKey) as! NSArray
        }
    }
    
    func object_forKeyWithValidationForClass_NSMutableArray(aKey: String) -> NSMutableArray {
        // CHECK FOR EMPTY
        
        if(self.allKeys.count == 0) {
            return NSMutableArray()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return NSMutableArray()
            }
        } else {
            // KEY NOT FOUND
            return NSMutableArray()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return NSMutableArray()
        }
        else {
           return ((self.object(forKey: aKey)) as AnyObject) as! NSMutableArray
        }
    }
    
    func object_forKeyWithValidationForClass_NSDictionary(aKey: String) -> NSDictionary {
        // CHECK FOR EMPTY
        if(self.allKeys.count == 0) {
            return NSDictionary()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return NSDictionary()
            }
        } else {
            // KEY NOT FOUND
            return NSDictionary()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return NSDictionary()
        }
        else {
            return self.object(forKey: aKey) as! NSDictionary
        }
    }
    
    func object_forKeyWithValidationForClass_NSMutableDictionary(aKey: String) -> NSMutableDictionary {
        // CHECK FOR EMPTY
        if(self.allKeys.count == 0) {
            return NSMutableDictionary()
        }
        
        // CHECK IF KEY EXIST
        if let val = self.object(forKey: aKey) {
            if((val as AnyObject).isEqual(NSNull())) {
                return NSMutableDictionary()
            }
        } else {
            // KEY NOT FOUND
            return NSMutableDictionary()
        }
        
        // CHECK FOR NIL VALUE
        let aValue : AnyObject = self.object(forKey: aKey)! as AnyObject
        if aValue.isEqual(NSNull()) {
            return NSMutableDictionary()
        }
        else {
            return self.object(forKey: aKey) as! NSMutableDictionary
        }
    }
    
    func dictionaryByReplacingNullsWithBlanks() -> NSMutableDictionary {
        
        let dictReplaced : NSMutableDictionary = self.mutableCopy() as! NSMutableDictionary
//        let null : AnyObject = NSNull()
//        let blank : NSString = ""
        /*
        for key : AnyObject in self.allKeys {
            let strKey : NSString  = key as! NSString
            let object : AnyObject = self.objectForKey(strKey)!
            if object.isEqual(null) {
                dictReplaced.setObject(blank, forKey: strKey)
                //                dictReplaced.removeObjectForKey(strKey)
            }else if object.isKindOfClass(NSDictionary) {
                dictReplaced.setObject(object.dictionaryByReplacingNullsWithBlanks(), forKey: strKey)
            }else if object.isKindOfClass(NSArray) {
                dictReplaced.setObject(object.arrayByReplacingNullsWithBlanks(), forKey: strKey)
            }
        }
         */
        return dictReplaced
    }
    
    
    func dictionaryByAppendingKey(value : String) -> NSMutableDictionary {
        let dictReplaced : NSMutableDictionary = self.mutableCopy() as! NSMutableDictionary
        dictReplaced.setObject(value, forKey: "reviewType" as NSCopying)
        return dictReplaced
    }
    
    
}


//MARK: - NSArray EXTENSIONS
//MARK: -
extension NSArray{
    
    func arrayByReplacingNullsWithBlanks () -> NSMutableArray {
        let arrReplaced : NSMutableArray = self.mutableCopy() as! NSMutableArray
        let null : AnyObject = NSNull()
        let blank : NSString = ""
        
        for idx in 0..<arrReplaced.count {
            let object : AnyObject = arrReplaced.object(at: idx) as AnyObject
            if object.isEqual(null) {
                arrReplaced.setValue(blank, forKey: object.key!!)
                //                arrReplaced.removeObjectAtIndex(idx)
            }else if object.isKind(of: NSDictionary.self) {
                
                //arrReplaced.replaceObject(at: idx, with: object.dictionaryByReplacingNullsWithBlanks())
                
            }else if object.isKind(of: NSArray.self) {
               // arrReplaced.replaceObject(at: idx, with: object.arrayByReplacingNullsWithBlanks())
            }
        }
        
        return arrReplaced
    }
    
    func arrayByAppendingKey(value : String) -> NSMutableArray {
        let arrReplaced : NSMutableArray = self.mutableCopy() as! NSMutableArray
        
        for idx in 0..<arrReplaced.count {
            let object : AnyObject = arrReplaced.object(at: idx) as AnyObject
            if object.isKind(of: NSDictionary.self) {
                
              //  arrReplaced.replaceObject(at: idx, with: object.dictionaryByAppendingKey(value: value))
            }
        }
        return arrReplaced
    }
}






