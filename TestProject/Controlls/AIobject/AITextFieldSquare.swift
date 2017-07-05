//
//  AITextField.swift
//  SwiftStructureDemo
//
//  Created by Govind ravaliya on 05/07/16.
//  Copyright © 2016 Govind ravaliya. All rights reserved.
//

import UIKit

enum AITextFieldValidationType_Square : Int {
    
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
    
    case CampusSelection
    
}

class AITextFieldSquare: UITextField, UITextFieldDelegate {
    
    var strValidationMessage : String = String()
    var strPlaceHolder : String = String()
    var strRightImageName : String = String()
   
    
    var maxLength : NSInteger?
    var minLength : NSInteger?
    
    // textfiled validation type
    var txtType : AITextFieldValidationType_Square?
    var textFieldValidationType :AITextFieldValidationType_Square {
        get {
            return self.textFieldValidationType
        }
        set {
            txtType = newValue
        }
    }
    
   
    //MARK:- LIFE CYLCLE
    //MARK:-
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
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

        // SET FONT
        self.font = UIFont.Font_Ubuntu_Regular(self.font!.pointSize)
        
        // CALL CHANGE TEXT
        self.addTarget(self, action: #selector(AITextFieldSquare.textFieldEditChange(textField:)), for: .editingChanged)
        
        // CALL CHANGE TEXT
         self.setupBorderTextFiled()
        
    }
    
    func fixUI()  {
        if ((self.placeholder?.length)!>0) {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!.localized ,attributes:[NSForegroundColorAttributeName: self.setPlaseHoderColor()])
        }
    }
    
    func updateTextFiled()  {
        self.setupBorderTextFiled()
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textFieldEditChange(textField : UITextField) -> Void {
        self.setupBorderTextFiled()
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
        
        // CHECK AND RESET TEXTFILED
        self.setupBorderTextFiled()
        
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
    
    
     // MARK: ________________________ SETUP TEXTFILED ________________________
    
    func setupBorderTextFiled() {
        
        self.borderStyle = UITextBorderStyle.line
        self.layer.borderWidth =  1.0
        
        let length: Int = self.text!.characters.count
        if length > 0 {
            self.setFillBorderColor()
        }else{
            self.setBlankBorderColor()
        }
  
    }
    
    
    // MARK: ________________________  ________________________
    
    
    // placeholder position
    
    func setBlankBorderColor() {
        self.layer.borderColor = UIColor.RGB(156, 156, 156, 1).cgColor
    }
    func setFillBorderColor() {
        self.layer.borderColor = UIColor.RGB(50, 50, 50, 1).cgColor
    }
    func setPlaseHoderColor() -> UIColor {
            return UIColor.RGB(178, 178, 178, 1)
        
    }
    
   
    
}


// MARK:- ************* AITEXTFIELD TEXT PICKER *************

class AITextFieldTextPicker: UITextField, UIPickerViewDelegate
{
    
   
    var doneHandler: ((_ sender:AITextFieldTextPicker,_ index : Int) -> (Void))?
    var valueChangeHandler: ((_ sender:AITextFieldTextPicker) -> (Void))?
    
    var selectedOption:String?
    var selectedIndex:Int?
    
    var pickerView:UIPickerView?
    var  arrPickerData : NSMutableArray = NSMutableArray()
    
    
    // MARK:- INIT
    //var lblBottomLine:UILabel?
    let margin:CGFloat = 0
    
    //MARK:- LIFE CYLCLE
    //MARK:-
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
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
    
    
    override func awakeFromNib()
    {
        
        self.tintColor =  UIColor.clear
        self.selectedIndex = 0
        
        
        let leftView : UIView = UIView(frame :CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        let imgeViewLeft : UIImageView = UIImageView(frame: leftView.bounds)
        leftView.addSubview(imgeViewLeft)
        imgeViewLeft.contentMode = .center
        imgeViewLeft.image = UIImage(named: "dropDown")
        self.rightView = leftView
        self.rightViewMode = .always
        self.rightView?.isUserInteractionEnabled = false
        
        super.awakeFromNib()
        
        
        if (arrPickerData.count != 0) {
            if(self.text != ""){
                let index : Int = self.arrPickerData.index(of: self.text!)
                self.pickerView?.selectRow(index, inComponent: 0, animated: true)
                
            }else{
                self.pickerView?.selectRow(0, inComponent: 0, animated: true)
            }
            
        }
       // self.lblBottomLine!.backgroundColor = UIColor.Color_samiDarkGray()
        self.textColor = UIColor.gray
        if ((self.placeholder?.length)!>0) {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,attributes:[NSForegroundColorAttributeName: UIColor.gray])
            
        }
        
        
        self.font = UIFont.Font_Ubuntu_Regular(self.font!.pointSize)
        
        self.doSetupInputView()
    }
    
    func setupUI() {
        
        // SET FONT
        self.font = UIFont.Font_Ubuntu_Regular(self.font!.pointSize)
        
        // CALL CHANGE TEXT
        // self.addTarget(self, action: #selector(AITextField.textFieldEditChange(_:)), for: .EditingChanged)
        
        // CALL CHANGE TEXT
        self.setupBorderTextFiled()
        
        
        
    }
    
    func fixUI()  {
        if ((self.placeholder?.length)!>0) {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!.localized ,attributes:[NSForegroundColorAttributeName: self.setPlaseHoderColor()])
        }
    }

    
    func setUpDataWithArray(arrData : NSArray,index:Int) {
        
        
        arrPickerData = arrData.mutableCopy() as! NSMutableArray
        self.selectedIndex = index
        self.pickerView?.reloadAllComponents()
        if (arrData.count != 0) {
            
            
            
            if arrPickerData.contains(self.text! as String) {
                
                self.selectedIndex = arrPickerData.index(of: self.text!)
                self.selectedOption = arrPickerData.object(at: self.selectedIndex!) as? String
                
            }
            self.pickerView?.selectRow(self.selectedIndex!, inComponent: 0, animated: true)
        }
        
    }
    
    
    func doSetupInputView()
    {
        // UIPICKERVIEW
        self.pickerView = UIPickerView()
        //self.pickerView!.dataSource = self
        self.pickerView!.delegate = self
        
        self.inputView = self.pickerView!
        
        // TOOLBAR ITEMS
        let btnDone: UIButton = UIButton()
        btnDone.setTitle("Done".localized, for: .normal)
        btnDone.setTitleColor(UIColor.white, for: .normal)
        btnDone.addTarget(self, action: #selector(btnDoneHandler(sender:)), for: .touchUpInside)
        btnDone.sizeToFit()
        
        let btnCancle: UIButton = UIButton()
        btnCancle.setTitle("Cancel".localized, for: .normal)
        btnCancle.setTitleColor(UIColor.white, for: .normal)
        btnCancle.addTarget(self, action: #selector(self.canclePicker(btn:)), for: .touchUpInside)
        btnCancle.sizeToFit()
        
        let barBtnDone: UIBarButtonItem = UIBarButtonItem.init(customView: btnDone)
        let barBtnFlexibleSpace: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton =  UIBarButtonItem.init(customView: btnCancle)
        
        
        
        // TOOLBAR
        let toolBar:UIToolbar = UIToolbar()
        toolBar.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44)
        toolBar.barTintColor = UIColor.AppColor.color_AppRedColor
        toolBar.isTranslucent = true
        toolBar.items = [cancelButton,barBtnFlexibleSpace,barBtnDone]
        
       self.inputAccessoryView = toolBar
    }
    
    func canclePicker(btn: UIBarButtonItem){
        self.resignFirstResponder()
    }
    
    func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        if action == #selector(sender!.cut(_:)) {return false}
        if action == #selector(sender!.paste(_:)) {return false}
        if action == #selector(sender!.selectAll(_:)) {return false}
        if action == #selector(sender!.select(_:)) {return false}
        return super.canPerformAction(action, withSender: sender)
    }
    
    // MARK: - BUTTON HANDLER
    
    
    func btnDoneHandler(sender:UIButton) {
        
       
        
        if((self.doneHandler) != nil){
            self.doneHandler!(self,self.selectedIndex!)
        }
        self.selectedIndex = self.pickerView?.selectedRow(inComponent: 0)
        self.pickerView?.selectRow(self.selectedIndex!, inComponent: 0, animated: true)
        self.text = arrPickerData.object(at: self.selectedIndex!) as? String
        self.resignFirstResponder()
        self.setupBorderTextFiled()
    }
    
    // MARK: - PICKERVIEW DELEGATE
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrPickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
   
        let arrString = NSMutableAttributedString(string: arrPickerData[row] as! String)
        arrString.addAttribute(NSForegroundColorAttributeName, value: UIColor.AppColor.color_AppRedColor, range: NSRange(location: 0, length: arrString.length))
        arrString.addAttribute(NSFontAttributeName , value: UIFont.Font_Ubuntu_Regular(17.0) , range: NSRange(location: 0,length: arrString.length))
        return arrString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
  
        self.selectedOption = arrPickerData.object(at: row) as? String
        self.selectedIndex = row
        if(self.valueChangeHandler != nil){
            self.valueChangeHandler!(self)
        }
    }
    
    
    
    // MARK: ________________________ SETUP TEXTFILED ________________________
    
    func setupBorderTextFiled() {
        
        self.borderStyle = UITextBorderStyle.line
        self.layer.borderWidth =  1.0
        
        let length: Int = self.text!.characters.count
        if length > 0 {
            self.setFillBorderColor()
        }else{
            self.setBlankBorderColor()
        }
        
    }

    
    func setBlankBorderColor() {
        self.layer.borderColor = UIColor.RGB(156, 156, 156, 1).cgColor
    }
    func setFillBorderColor() {
        self.layer.borderColor = UIColor.RGB(50, 50, 50, 1).cgColor
    }
    func setPlaseHoderColor() -> UIColor {
        return UIColor.RGB(178, 178, 178, 1)
        
    }
    
    
}



