//
//  Macro.swift
//  tableWithCollectionCell
//
//  Created by Govind ravaliya on 14/07/16.
//  Copyright © 2016 Govind ravaliya. All rights reserved.
//

import Foundation
import UIKit


//MARK: - STRUCT
//MARK: -


// WEBLINK
struct AppWebLink {
    static var TermsConditionsLink  = "http://180.211.99.165/rs/asra/about/terms.html"
    static var PrivacyPolicyLink    = "http://180.211.99.165/rs/asra/about/privacy.html"
    static var FacebookLink         = "https://www.facebook.com/"
    static var Instagram            = "https://www.instagram.com/asr3_delivery"
    static var TwitterLink          = "https://twitter.com/ASR3_Delivery"
    static var AppStoreLink         = "https://itunes.apple.com/app/id1170475170"
}


//App Tab names
struct AppHomeScreenTabName {
    static var New          = "Sounds"
    static var Favourites   = "Favourites"
    static var Timers       = "Timers"
    static var More         = "More"
    static var Premium      = "Premium"
}


//App Font names
struct AppTitle {
    static var Home         = "Home"
    static var Second       = "Second"
    static var Third        = "Third"
    static var Forth        = "Forth"
}




//App Screen Names for Google analytics // ex
struct AppScreenNamesForGoogleAnalytics {
    struct soundScreen{
        static var screenName       = "Sounds"
        static var screenAction     = "Sounds_List"
        static var screenEventLable = "List_of_Sounds"
    }
    
    struct createTimerScreen{
        static var screenName       = "Create Timer"
        static var screenAction     = "Create_Timer"
        struct screenEvents{
            static var screenEventAlarmLable = "Create_Alarm"
            static var screenEventTimerLable = "Create_Timer"
        }
    }
    
}


//App Notification observer Names // ex
struct AppNotificationObservers {
    static var observerForHomeScreenCountDownBanner = "observerForHomeScreenCountDownBanner"
}


//App userDefault keys used
struct AppUserDefaultKeys {
    static var DeviceToken                  = "deviceToken"
}


//in App Purchase PurchaseID // ex
struct AppInAppPurchaseProductIds{
    static var oneMonthlyProductId      = "com.sleepsounds.app.1month"
}



//Core Data TableName // ex
struct AppTableName {
    
    static var tblEntityMergeSounds            = "EntityMergeSounds"
    struct tblEntityMergeSoundsColumnNames {
        static var MergeSoundId                   = "mergeSoundId"
        static var MergeSoundName                 = "mergeSoundName"
        static var MergeSoundPath                 = "mergeSoundPath"
        static var MergeSoundCreatedDateTimeStamp = "mergeSoundCreatedDateTimeStamp"
    }
    
    static var tblEntitySingleSoundForAlarm            = "EntitySingleSoundForAlarm"
    struct tblEntitySingleSoundForAlarmColumnNames {
        static var SingleSoundID                   = "singleSoundID"
        static var SingleSoundName                 = "singleSoundName"
        static var SingleSoundPath                 = "singleSoundPath"
        static var SingleSoundCreatedDateTimeStamp = "singleSoundCreatedDate"
    }
    
}






//App Alert messages
struct AppAlertMessages {
    
    static var AlertMessageForNoSoundPlayingClearButtonClicked    = "Please play one sound first."
    
    static var AlertMessageForNoSoundPlayingPlayButtonClicked     = "Please select one sound first."
    
    static var AlertMessageForNoSoundPlayingAddToFavouritesClicked    = "In order to save your current selection as a favourite,you must first select some sounds."
    
    static var AlertMessageForMaximumSoundPlay   = "You can not select more than 9 sounds."
    
    static var AlertMessageForFavouriteSoundName = "Give name to your favorite sound."
    
    static var AlertMessageForSuccessOfSoundCreated = "Sounds added to favorites."
    
    static var AlertMessageForNoSoundSelectionInFavourite = "Please select one sound first."
    
    static var AlertMessageForInternetConnectionLost = "You need internet. Come back when you have got it 🙂"
    
    static var AlertMessageForAddFavourite = "Select your favourite sounds and click on favourite button at bottom left of screen"
    
    static var AlertMessageForMixWithOtherSoundUnlock = "Please purchase premium version to unlock this feature."
    
    static var txt_ForgotScreenTitle = "Forgot Your Password"
    
    static var txt_ForgotScreenInfoText = "Enter your email address and we'll send you a link to reset your password"
    
    static var message_SomethingWrong = "Oops.. Something went wrong !!"
    
    static var message_InternetNotAvailable = "Internet connection is not available. Please check your internet connection and try again."
    
    static var message_LocationServiceStart  = "You have to enable the Location Service to use this App. To enable, please go to Settings >> Privacy >> Location Services"
    
    static var message_LocationServiceDisabled = "You currently have all location services for this device disabled"
    
    static var message_ChangePasswordSuccess = "password change successfully"
    
    static var message_ForgotPasswordSuccess = "Please check you mail for new password"
    
    static var message_NewPasswordNotMatch = "Newpassword and ConfirmPassword is not match"
    
    static var message_Nodatatext = "No data available"
    
    static var message_Trums = "I hereby confirm that I read the privacy policy thoroughly and agree to it."
    
    static var message_PrivacyPolicyCheck  = "You must agree privacy policy before signup."
    
    static var message_VerificationCheck  = "Verification code not match."
    
}










