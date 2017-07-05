//
//  AITextField.swift
//  SwiftStructureDemo
//
//  Created by Agile-mac on 05/07/16.
//  Copyright © 2016 Agile-mac. All rights reserved.
//

import UIKit

enum AITextFieldValidationType : Int {
    
    case Text
    case Text_NOSPACE
    
    case Text_Number
    case Text_Number_NOSPACE
    
    case Text_Characters
    case Text_Characters_NOSPACE
    
    case Name
    case Name_NOSPACE
    
    case Phone
    case Number
    case Number_Nozero
    
    case Email
    case Password
    
}


class AITextField: UITextField, UITextFieldDelegate {
    
    var strValidationMessage : String = String()
    var strPlaceHolder : String = String()
    var strRightImageName : String = String()
    
    var lblBottomLine : UILabel?
    let margin : CGFloat = 0
    
    var lblPlaceHolder : UILabel?
    let frame_lblPlaceHolder : CGRect = CGRectMake(0, 0, 0, 0)
    
    var maxLength : NSInteger?
    var minLength : NSInteger?
    
    // textfiled validation type
    var txtType : AITextFieldValidationType?
    var textFieldValidationType :AITextFieldValidationType {
        get {
            return self.textFieldValidationType
        }
        set {
            txtType = newValue
        }
    }
    
    
    //MARK:- LIFE CYLCLE
    //MARK:-
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 0, 0)
    }
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 0, 0)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         self.setupUI()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.fixUI()
    }

    
    //MARK:- LENGHT VALIDATION
    //MARK:
    func setUpTextFieldForLengthValidation(minLength : NSInteger, maxLength : NSInteger) {
        self.maxLength = maxLength
        self.minLength = minLength
    }
    
    func setupUI() {
        
        //DELEGATE
        self.delegate = self
      
        //VALIDATIONS
        if (self.minLength == nil) {
            self.minLength = 0
        }
        
        if (self.maxLength == nil  || self.maxLength == 0) {
            self.maxLength = 256
        }

        // CALL CHANGE TEXT
        self.addTarget(self, action: #selector(AITextField.textFieldEditChange(_:)), forControlEvents: .EditingChanged)
      
    }
    
    func fixUI()  {
        
        if (self.placeholder?.length>0) {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,attributes:[NSForegroundColorAttributeName: self.setPlaseHoderColor()])
        }
  
    }
    
    
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
        if action == #selector(self.paste) {
            return false
        }
        if action == #selector(self.select) {
            return false
        }
        if action == #selector(self.selectAll) {
            return false
        }
        if action == #selector(self.copy(_:)) {
            return false
        }
        if action == #selector(self.cut(_:)) {
            return false
        }
        if action == #selector(self.delete(_:)) {
            return false
        }
        return true
    }
    
   
    
  
    // MARK: ________________________ AITextField Delegate ________________________
    
    //AITextField Delegate
    func textFieldEditChange(textField : UITextField) -> Void {
       
        
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        if  txtType == .Text ||
            txtType == .Text_NOSPACE ||
            txtType == .Text_Number ||
            txtType == .Text_Number_NOSPACE ||
            txtType == .Text_Characters ||
            txtType == .Text_Characters_NOSPACE ||
            txtType == .Name ||
            txtType == .Name_NOSPACE  {
            
            textField.keyboardType = UIKeyboardType.Default
        }
        else if txtType == .Phone ||
            txtType == .Number ||
            txtType == .Number_Nozero{
          
            textField.keyboardType = UIKeyboardType.PhonePad
        }
        else if txtType == .Email {
            textField.keyboardType = UIKeyboardType.EmailAddress
        }
        else if txtType == .Password {
            textField.keyboardType = UIKeyboardType.NumbersAndPunctuation
            textField.secureTextEntry = true
        }
        
        textField.autocorrectionType = UITextAutocorrectionType.No
        
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        let trimmedString = textField.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        textField.text = trimmedString
       
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && (string == " ") {
            return false
        }
        
        if self.maxLength != 0 {
            if range.location >= self.maxLength {
                return false
            }
        }
        
        self.checkEmoji(string)
        
        if  txtType == .Text ||
            txtType == .Text_NOSPACE ||
            txtType == .Text_Number ||
            txtType == .Text_Number_NOSPACE ||
            txtType == .Text_Characters ||
            txtType == .Text_Characters_NOSPACE ||
            txtType == .Name ||
            txtType == .Name_NOSPACE  {
            
            return self.checkTextBlock(textField, range: range, string: string)
        }
        else if txtType == .Phone ||
                txtType == .Number ||
                txtType == .Number_Nozero{
            
            return self.checkNumberBlock(textField, range: range, string: string)
        }
        else if txtType == .Email ||
                txtType == .Password {
            
            return self.checkEmailAndPasswordBlock(textField, range: range, string: string)
        }
       
        return true
    }
    
    
    
    // MARK: ________________________ ALL VALIDATION  ________________________
    
    func checkTextBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        
        if txtType == .Text{
         charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<> ")
        }
        else if txtType == .Text_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<>")
        }
        else if txtType == .Text_Number{
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ")
        }
        else if txtType == .Text_Number_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        }
        else if txtType == .Text_Characters{
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*(){}[]_-+*/~`.?<> ")
        }
        else if txtType == .Text_Characters_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*(){}[]_-+*/~`.?<>")
        }
        else if txtType == .Name {
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        }
        else if txtType == .Name_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        }
       
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        let length: Int = textField.text!.characters.count
        if length > 0 {
            let originalString: String = textField.text!
            let index: Int = length
            var theCharacter : String = String()
            theCharacter = String(originalString[originalString.startIndex.advancedBy(index-1)])
  
            if theCharacter.hasPrefix(" ") && string.hasPrefix(" ") {
                return false
            }
        }
        if (string == "") {
            return true
        }
        
        if (string.rangeOfCharacterFromSet(charactersToBlock) != nil) {
             return true
        }
        else {
            return false
        }
        
        
        
    }
    
    func checkNumberBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        if txtType == .Phone{
            charactersToBlock = NSCharacterSet(charactersInString:"0123456789")
            if (range.location == 0 &&  string == " ") || (range.location == 0 &&  string == "0") {
                return false
            }
        }
        else if txtType == .Number {
            charactersToBlock = NSCharacterSet(charactersInString: "0123456789")
        }
        else if txtType == .Number_Nozero{
            charactersToBlock = NSCharacterSet(charactersInString: "123456789")
        }
       
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        if string == ""  {
            return true
        }
        
        if (string.rangeOfCharacterFromSet(charactersToBlock) != nil) {
            return true
        }
        else {
            return false
        }
       
    }
    
    func checkEmailAndPasswordBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        if txtType == .Email || txtType == .Password{
            charactersToBlock = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<>")
        }
       
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        if (string == "") {
            return true
        }
        if (string.rangeOfCharacterFromSet(charactersToBlock) != nil) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func checkEmoji(string : String) -> Bool {
        
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        
        for range in emojiRanges {
            for i in range {
                let c = String(UnicodeScalar(i))
                if (string == c) {
                    return false
                }
            }
        }
        
        return true
        
    }
    
    
    
    
    
    // MARK: ________________________  ________________________
    
    
    func setPlaseHoderColor() -> UIColor {
            return UIColor.RGB(178, G: 178, B: 178, A: 1)
    }
    
    
    
    
}





