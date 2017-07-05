//
//  Globals.swift
//  SwiftStructureDemo
//
//  Created by Govind ravaliya on 04/07/16.
//  Copyright © 2016 Govind ravaliya. All rights reserved.
//

import Foundation
import UIKit
import CFNetwork
import WebKit



//MARK:- ________________________ GENERAL ________________________
//MARK: -


//:- App IDS
struct AppIds{
    static var  AppStoreId      = "1217345846"  // App Store ID
    static var  AdMobID         = "ca-app-pub-5763547652932018/8077300881"  // Ad Mob ID
    static var  FlurryID        = "SSHS9KG8P6MFK76RJC62"  // Flurry ID
}

//:- App Data
struct AppData{
    static var  AppName             = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String // App Name
    static var  AppBundleVersion    = Bundle.main.infoDictionary?["CFBundleVersion"] as! String // App Bundle number
    static var  AppVersion          = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject  // App Version
    static var  deviceModelName     = UIDevice.current.description  // Device Model Name
    static var  deviceVersionOS     = UIDevice.current.systemVersion  // Device Version Number
}

//:-    GET MAIN STORYBOARD
let storyBoard = UIStoryboard(name: IS_IPAD_DEVICE() ? "Storyboard-Ipad" : "Main", bundle: nil)

//:-    Get Current TimeStamp
var Timestamp: String {
    return "\(NSDate().timeIntervalSince1970 * 1000)"
}

//:-    Calculate available free space & total space
var availableFreeSpace:String {
    get{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
            if let freeSize = dictionary[FileAttributeKey.systemFreeSize] as? NSNumber {
                return "\(freeSize.int64Value/(1024*1024))"
            }
        }else{
            print("Error Obtaining System Memory Info:")
        }
        return ""
    }
}

//:-
func getTotalSize() -> Int64?{
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    if let dictionary = try? FileManager.default.attributesOfFileSystem(forPath: paths.last!) {
        if let freeSize = dictionary[FileAttributeKey.systemSize] as? NSNumber {
            return freeSize.int64Value
        }
    }else{
        print("Error Obtaining System Memory Info:")
    }
    return nil
}

//:-    DEBUG PRINT MODE
func printT(items: AnyObject) {
    
    if _isDebugAssertConfiguration() {
        print(items)
    } else {
        
    }
}

//:-    APP DELEGATE OBJECT
var appDelegate : AppDelegate {
    get {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

//:-    SCREEN SIZE
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH  = UIScreen.main.bounds.size.width


//MARK:- ________________________ DEVICE CHECK ________________________
//MARK: -

//Check IsiPhone Device
func IS_IPHONE_DEVICE()->Bool{
    let deviceType = UIDevice.current.userInterfaceIdiom == .phone
    return deviceType
}

//Check IsiPad Device

func IS_IPAD_DEVICE()->Bool{
    let deviceType = UIDevice.current.userInterfaceIdiom == .pad
    return deviceType
}

//iPhone 4 OR 4S

func IS_IPHONE_4_OR_4S()->Bool{
    let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 480
    var device:Bool = false
    
    if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
        device = true
    }
    return device
}

//iPhone 5 OR OR 5C OR 4S

func IS_IPHONE_5_OR_5S()->Bool{
    let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 568
    var device:Bool = false
    if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
        device = true
    }
    return device
}

//iPhone 6 OR 6S

func IS_IPHONE_6_OR_6S()->Bool{
    let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 667
    var device:Bool = false
    
    if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
        device = true
    }
    return device
}

//iPhone 6Plus OR 6SPlus

func IS_IPHONE_6P_OR_6SP()->Bool{
    let SCREEN_HEIGHT_TO_CHECK_AGAINST:CGFloat = 736
    var device:Bool = false
    
    if(SCREEN_HEIGHT_TO_CHECK_AGAINST == SCREEN_HEIGHT)	{
        device = true
    }
    return device
}



// MARK:- __________________ CEHCK SYSTEM VERSION  _____________
// MARK:

func SYSTEM_VERSION_EQUAL_TO(version: String) -> Bool {
    
   return UIDevice.current.systemVersion.compare(version,
                                                 options: NSString.CompareOptions.numeric) == ComparisonResult.orderedSame
}

func SYSTEM_VERSION_GREATER_THAN(version: String) -> Bool {
    
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedDescending
}

func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) != ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) == ComparisonResult.orderedAscending
}

func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: String) -> Bool {
    return UIDevice.current.systemVersion.compare(version,
                                                  options: NSString.CompareOptions.numeric) != ComparisonResult.orderedDescending
}


// MARK:- _______________ USER NOTIFICATION _______________
// MARK:

func postNotificatio_REGISTER(viewConroller:UIViewController,key:String,selector : Selector) {
    NotificationCenter.default.addObserver(viewConroller,
                                           selector: selector,
                                           name: NSNotification.Name(rawValue: key),
                                           object: nil)
}

func postNotificatio_CALL(key:String) {
    NotificationCenter.default.post(name: NSNotification.Name(rawValue: key), object: nil)
}

func postNotificatio_REMOVE(viewConroller:UIViewController,key:String) {
    NotificationCenter.default.removeObserver(viewConroller,
                                              name: NSNotification.Name(rawValue: key),
                                              object: nil)
}



// MARK:- ________________________ USER DEFAULTS ________________________
// MARK:

func set_UserDefaults(key: String, value: Any) {
    UserDefaults.standard.set(value, forKey: key)
    UserDefaults.standard.synchronize()
}

func get_UserDefaults(key: String) -> Any? {
    return UserDefaults.standard.value(forKey: key) as AnyObject?
}

func remove_UserDefaults(key: String) {
    UserDefaults.standard.removeObject(forKey: key)
    UserDefaults.standard.synchronize()
}


// MARK: ________________________ SET MODEL DATA IN USERDEFAULTS ________________________
// MARK:

func setModelDataInUserDefaults(key:String,value:Any){
    let data :Data = NSKeyedArchiver.archivedData(withRootObject: value)
    set_UserDefaults(key: key, value: data as AnyObject)
}

func getModelDataFromUserDefaults(key:String) -> Any? {
    if let object = get_UserDefaults(key: key) as? Data {
        return NSKeyedUnarchiver.unarchiveObject(with: object)
    }
    return nil
}





