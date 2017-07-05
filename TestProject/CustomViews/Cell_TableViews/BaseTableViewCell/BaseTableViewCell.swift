//
//  BaseTableViewCell.swift
//  TestProject
//
//  Created by Govind ravaliya on 05/07/17.
//  Copyright © 2017 Agile.ShareAd. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.isExclusiveTouch = true
        self.contentView.isExclusiveTouch = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func roundImageView(imgView:UIImageView){
        
        imgView.layer.cornerRadius = imgView.frame.height/2
        imgView.clipsToBounds = true
    
    }
    
    
}
