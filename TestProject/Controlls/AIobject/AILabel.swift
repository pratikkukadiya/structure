//
//  AILabel.swift
//  SwiftStructureDemo
//
//  Created by Govind ravaliya on 04/07/16.
//  Copyright © 2016 Govind ravaliya. All rights reserved.
//

import UIKit

class AILabel: UILabel {

    
    //MARK: - LIFE CYCLE
    //MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
    
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.font = UIFont.Font_Ubuntu_Regular(self.font.pointSize)
    }
    
}

class AILabelRegularBorder: UILabel {
    
    
    //MARK: - LIFE CYCLE
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
    
    override func drawText(in rect: CGRect) {
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 3.0, right: 5.0)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        
    }
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
       // self.minimumScaleFactor = 0.5
     //   self.font = UIFont.Font_Ubuntu_Regular(self.font.pointSize)
    }
    
}

class AILabelRegular: UILabel {
    
    
    //MARK: - LIFE CYCLE
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
   
//    func drawTextInRect(rect: CGRect) {
//        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
//        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
//        
//    }
   
    func drowEdge(rect: CGRect) {
    
        let insets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        super.drawText(in: UIEdgeInsetsInsetRect(self.frame, insets))
    
    }
    
    
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.font = UIFont.Font_Ubuntu_Regular(self.font.pointSize)
    }
    
}

class AILabelLight: UILabel {
    
    
    //MARK: - LIFE CYCLE
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
   

    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
       
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.font = UIFont.Font_Ubuntu_Light(self.font.pointSize)
    }
    
}

class AILabelBold: UILabel {
    
    
    //MARK: - LIFE CYCLE
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
    
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.font = UIFont.Font_Ubuntu_Bold(self.font.pointSize)
    }
    
}

class AILabelMedium: UILabel {
    
    
    //MARK: - LIFE CYCLE
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.customiseLabel()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.customiseLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override var text: String? {
        get { return super.text }
        set(v){ super.text = v?.localized }
    }
    
    
    //MARK: - CUSTOMISE LABEL
    //MARK: -
    
    func customiseLabel(){
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.font = UIFont.Font_Ubuntu_Medium(self.font.pointSize)
    }
    
}




