//
//  AIButton.swift
//  ScarletAndBleu
//
//  Created by Dhaval Nena on 23/05/16.
//  Copyright © 2016 Dhaval Nena. All rights reserved.
//

import UIKit


class AIButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.commonInit()
	}
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.commonInit()
	}
	override func awakeFromNib() {
		super.awakeFromNib()
		self.commonInit()
	}
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
   
	func commonInit() {
        
        self.titleLabel!.font = UIFont.Font_System(self.titleLabel!.font.pointSize)
  	}
}



class AIButtonRegular: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
    
    func commonInit() {
        
       
        self.titleLabel!.font = UIFont.Font_Ubuntu_Regular(self.titleLabel!.font.pointSize)
        
    }
}

class AIButtonLight: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
    
    func commonInit() {
       
        self.titleLabel!.font = UIFont.Font_Ubuntu_Light(self.titleLabel!.font.pointSize)
        
    }
}

class AIButtonBold: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
    
    func commonInit() {
        
        self.titleLabel!.font = UIFont.Font_Ubuntu_Bold(self.titleLabel!.font.pointSize)
        
    }
}

class AIButtonMedium: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
    
    func commonInit() {
       
        self.titleLabel!.font = UIFont.Font_Ubuntu_Medium(self.titleLabel!.font.pointSize)
        
    }
}

class AIButtonRound: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    func commonInit() {
        self.titleLabel!.font = UIFont.Font_Italic(self.titleLabel!.font.pointSize)
        self.backgroundColor = UIColor.green
        self.setCornerradius(self.frame.height/2);
        self.setShadowView(1, height: 1, Opacidade:10, maskToBounds: false, radius: 2)
        self.setFrameBorder(UIColor.red, width: 1.0)
    }
    
    
}

class AIButtonUnderLine: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    override var titleLabel: UILabel?{
        get {super.setTitle(super.titleLabel?.text!.localized, for: .normal)
            return super.titleLabel}
        set(v){super.titleLabel?.text = v?.text!.localized }
    }
    
    func commonInit() {
        
        self.titleLabel!.font = UIFont.Font_System(self.titleLabel!.font.pointSize)
        self.underlineButton(button: self, text: (self.titleLabel?.text!)!)
    }
    
    func underlineButton(button : UIButton, text: String) {
        
        let titleString : NSMutableAttributedString = NSMutableAttributedString(string: text.localized)
        let myRange = NSRange(location: 0, length: text.characters.count)
        titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.styleSingle.rawValue, range: myRange)
        titleString.addAttribute(NSUnderlineColorAttributeName, value: UIColor.gray, range: myRange)
        button.setAttributedTitle(titleString, for: .normal)
        
    }
}


