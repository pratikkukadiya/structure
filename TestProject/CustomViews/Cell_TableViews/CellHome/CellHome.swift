//
//  TableViewCellHome.swift
//  TestProject
//
//  Created by Govind ravaliya on 05/07/17.
//  Copyright © 2017 Agile.ShareAd. All rights reserved.
//

import UIKit

class CellHome: BaseTableViewCell {

    
    @IBOutlet var lableDetail: UILabel!
    @IBOutlet var lableTitle: UILabel!
    
    //MARK: - Cell Life Cycle
    //MARK: -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.updateCellUI()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    
    }
    
    //MARK: - Format UI
    //MARK: -
   
    func updateCellUI(){
        
        self.lableTitle.font = UIFont.Font_System(20.0)
        self.lableTitle.tintColor = UIColor.AppColor.color_AppRedColor

        self.lableDetail.font = UIFont.Font_System(20.0)
        self.lableDetail.tintColor = UIColor.AppColor.color_NavigationBar
     
    }
    //MARK: - Data SetUp
    //MARK: -
    
    
    func updateData(data : NSMutableDictionary) {
        
        self.lableTitle.text = data.object(forKey: "title") as? String
        self.lableDetail.text = data.object(forKey: "detail") as? String
        
        
    }
  
    
    
}
