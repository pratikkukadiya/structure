//
//  BaseTableView.swift
//  TestProject
//
//  Created by Govind ravaliya on 05/07/17.
//  Copyright © 2017 Govind ravaliya.ShareAd. All rights reserved.
//

import UIKit
//import TPKeyboardAvoiding

class BaseTableView:UITableView {
    
    //MARK :- TableView Life Cycle
    //MARK :-
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.commonInit()
    }
    
    
    func commonInit(){
        self.tableFooterView = UIView()
        self.separatorStyle = .none
        self.estimatedRowHeight = 200
        self.rowHeight = UITableViewAutomaticDimension
    }
    
    func showTextIfNoDataAvailable(strText:String,table:UITableView){
        let emptyLabel = UILabel(frame: CGRect(x: 0, y: 0, width: table.bounds.size.width, height: table.bounds.size.height))
        emptyLabel.text = strText
        emptyLabel.textAlignment = NSTextAlignment.center
//        emptyLabel.font = UIFont.appFont_Medium_WithSize(fontSize: CGFloat(24.0).proportionalFontSize())
//        emptyLabel.textColor = UIColor.appLightSoundSeperatorColor()
        
        table.backgroundView = emptyLabel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        fatalError("init(coder:) has not been implemented")
    }
    


}
