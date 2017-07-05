//
//  AITextField.swift
//  SwiftStructureDemo
//
//  Created by Govind ravaliya on 05/07/16.
//  Copyright © 2016 Govind ravaliya. All rights reserved.
//

import UIKit


class AITextFieldMaterialLine: UITextField, UITextFieldDelegate {
    
    var strValidationMessage : String = String()
    var strPlaceHolder : String = String()
    var strRightImageName : String = String()
    
    var lblBottomLine : UILabel?
    let margin : CGFloat = 0
    
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
    
    
    // MARK: ________________________ LIFE CYLCLE ________________________
    // MARK:-
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 0, dy: 0)
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
        self.addTarget(self, action: #selector(self.textFieldEditChange(textField:)), for: .editingChanged)
       
      
        // SETUP TEXTFILED
         self.addBottomLine()
        
        
    }
    
    func fixUI()  {
        
        self.lblBottomLine?.frame = (frame: CGRect(x: margin, y: self.frame.size.height-1, width: self.frame.size.width-(margin*2), height: 0.5)) as! CGRect
        if ((self.placeholder?.length)!>0) {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,attributes:[NSForegroundColorAttributeName: self.setPlaseHoderColor()])
        }
    }
    
    func updateTextFiled() {
        self.addBottomLine()
    }
    
    
    func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        
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
        
        // CHANGE COLOR
        self.changeBottmLineColor()
       
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if  txtType == .Text ||
            txtType == .Text_NOSPACE ||
            txtType == .Text_Number ||
            txtType == .Text_Number_NOSPACE ||
            txtType == .Text_Characters ||
            txtType == .Text_Characters_NOSPACE ||
            txtType == .Name ||
            txtType == .Name_NOSPACE  {
            
            textField.keyboardType = UIKeyboardType.default
        }
        else if txtType == .Phone ||
            txtType == .Number ||
            txtType == .Number_Nozero{
            
            textField.keyboardType = UIKeyboardType.phonePad
        }
        else if txtType == .Email {
            textField.keyboardType = UIKeyboardType.emailAddress
        }
        else if txtType == .Password {
            textField.keyboardType = UIKeyboardType.numbersAndPunctuation
            textField.isSecureTextEntry = true
        }
        
        textField.autocorrectionType = UITextAutocorrectionType.no
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        let trimmedString = textField.text!.trimmingCharacters(in: NSCharacterSet.whitespaces)
        textField.text = trimmedString
        // RESET TEXTFIELD
        self.resetBottmLineColor()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if range.location == 0 && (string == " ") {
            return false
        }
        
        if self.maxLength != 0 {
            if range.location >= self.maxLength! {
                return false
            }
        }
        
        self.checkEmoji(string: string)
        
        if  txtType == .Text ||
            txtType == .Text_NOSPACE ||
            txtType == .Text_Number ||
            txtType == .Text_Number_NOSPACE ||
            txtType == .Text_Characters ||
            txtType == .Text_Characters_NOSPACE ||
            txtType == .Name ||
            txtType == .Name_NOSPACE  {
            
            return self.checkTextBlock(textField: textField, range: range, string: string)
        }
        else if txtType == .Phone ||
            txtType == .Number ||
            txtType == .Number_Nozero{
            
            return self.checkNumberBlock(textField: textField, range: range, string: string)
        }
        else if txtType == .Email ||
            txtType == .Password {
            
            return self.checkEmailAndPasswordBlock(textField: textField, range: range, string: string)
        }
        
        return true
    }
    
    
    
    // MARK: ________________________ ALL VALIDATION  ________________________
    
    func checkTextBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        
        if txtType == .Text{
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<> ")
        }
        else if txtType == .Text_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<>")
        }
        else if txtType == .Text_Number{
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ")
        }
        else if txtType == .Text_Number_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        }
        else if txtType == .Text_Characters{
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*(){}[]_-+*/~`.?<> ")
        }
        else if txtType == .Text_Characters_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*(){}[]_-+*/~`.?<>")
        }
        else if txtType == .Name {
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        }
        else if txtType == .Name_NOSPACE {
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
        }
        
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        let length: Int = textField.text!.characters.count
        if length > 0 {
            let originalString: String = textField.text!
            // let index: Int = length
            var theCharacter : String = String()
            
            theCharacter = String(originalString[originalString.startIndex])
            
            //  theCharacter = String(originalString[originalString.startIndex.advancedBy(index-1)])
            
            if theCharacter.hasPrefix(" ") && string.hasPrefix(" ") {
                return false
            }
        }
        if (string == "") {
            return true
        }
        
        if (string.rangeOfCharacter(from: charactersToBlock as CharacterSet) != nil) {
            return true
        }
        else {
            return false
        }
        
        
        
    }
    
    func checkNumberBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        if txtType == .Phone{
            charactersToBlock = NSCharacterSet(charactersIn:"0123456789")
            if (range.location == 0 &&  string == " ") || (range.location == 0 &&  string == "0") {
                return false
            }
        }
        else if txtType == .Number {
            charactersToBlock = NSCharacterSet(charactersIn: "0123456789")
        }
        else if txtType == .Number_Nozero{
            charactersToBlock = NSCharacterSet(charactersIn: "123456789")
        }
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        if string == ""  {
            return true
        }
        
        if (string.rangeOfCharacter(from: charactersToBlock as CharacterSet) != nil) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func checkEmailAndPasswordBlock(textField: UITextField,range: NSRange,string: String) -> Bool  {
        
        var charactersToBlock : NSCharacterSet = NSCharacterSet()
        
        if txtType == .Email || txtType == .Password{
            charactersToBlock = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*(){}[]_-+*/~`.?<>")
        }
        
        
        if range.location == 0 {
            if string.hasPrefix(" ") {
                return false
            }
        }
        if (string == "") {
            return true
        }
        if (string.rangeOfCharacter(from: charactersToBlock as CharacterSet) != nil) {
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
                let c = String(describing: UnicodeScalar(i))
                if (string == c) {
                    return false
                }
            }
        }
        
        return true
        
    }

    
    // MARK: ________________________ CHANGE BOTTOM LINE COLOR  ________________________
    
    func changeBottmLineColor() {
        
        let length: Int = self.text!.characters.count
        if length > 0 {
            self.lblBottomLine?.backgroundColor = UIColor.red
        }else{
            self.lblBottomLine?.backgroundColor = UIColor.black
        }
        
    }
    func resetBottmLineColor() {
        self.lblBottomLine?.backgroundColor = UIColor.black
    }
    
     // MARK: ________________________ CHANGE PLACEHOLDER  ________________________
    
   
    
    
    func addBottomLine() {
        
        self.lblBottomLine = UILabel(frame: CGRect(x: margin, y: self.frame.size.height-1, width: self.frame.size.width-(margin*2), height: 1))
        self.lblBottomLine!.backgroundColor = UIColor.black
        self.addSubview(self.lblBottomLine!)
        self.borderStyle = .none
        
    }
    
   
    
    // MARK: ________________________  ________________________
    
    func setPlaseHoderColor() -> UIColor {
        return UIColor.RGB(178, 178, 178, 1)
    }
    
    
    
    
    
}





