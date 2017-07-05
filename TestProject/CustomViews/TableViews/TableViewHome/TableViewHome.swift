//
//  tableViewHome.swift
//  TestProject
//
//  Created by Govind ravaliya on 05/07/17.
//  Copyright © 2017 Govind ravaliya.ShareAd. All rights reserved.
//

import UIKit

enum MoreTableViewCellType : Int {
    //    case SystemVomume
    case Title
    case contactUs
    case likeUsOnFaceebook
    case Count
}

class TableViewHome : BaseTableView {
    
    
    var blocKCallForDidSelect:((_ selectedIndex : Int)->Void)!
  
    var moreArray : NSMutableArray! = NSMutableArray()
    
    
    override func awakeFromNib(){
        
        super.awakeFromNib()
        self.doSetSetUpData()
        self.doSetUpTable()
    }
    
    private func doSetUpTable(){
        
        self.register(UINib.init(nibName: "CellHome", bundle: nil), forCellReuseIdentifier: "CellHome")
        self.bounces = true
        self.delegate = self
        self.dataSource = self
    }
    
    func doSetSetUpData() {
        
        //moreArray
        
        moreArray.removeAllObjects()
        
        var detailDict: NSMutableDictionary = NSMutableDictionary()
        detailDict.setValue("Features of the App", forKey: "title")
        detailDict.setValue("Detail of Features", forKey: "detail")
        detailDict.setValue("0", forKey: "isSelected")
        moreArray.add(detailDict)
        
        detailDict = NSMutableDictionary()
        detailDict.setValue("Helpful Tips", forKey: "title")
        detailDict.setValue("Detail of Helpful Tips Detail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful TipsDetail of Helpful Tips", forKey: "detail")
        detailDict.setValue("0", forKey: "isSelected")
        moreArray.add(detailDict)
        
        detailDict = NSMutableDictionary()
        detailDict.setValue("Features of the App", forKey: "title")
        detailDict.setValue("Detail of Features", forKey: "detail")
        detailDict.setValue("0", forKey: "isSelected")
        moreArray.add(detailDict)
        
        detailDict = NSMutableDictionary()
        detailDict.setValue("Helpful Tips", forKey: "title")
        detailDict.setValue("Detail of Helpful Tips", forKey: "detail")
        detailDict.setValue("0", forKey: "isSelected")
        moreArray.add(detailDict)
        
        detailDict = NSMutableDictionary()
        detailDict.setValue("Features of the App", forKey: "title")
        detailDict.setValue("Detail of Features", forKey: "detail")
        detailDict.setValue("0", forKey: "isSelected")
        moreArray.add(detailDict)
        
        detailDict = NSMutableDictionary()
        detailDict.setValue("Helpful Tips", forKey: "title")
        detailDict.setValue("Detail of Helpful Tips", forKey: "detail")
        detailDict.setValue("0", forKey: "isSelected")
        moreArray.add(detailDict)
        
    }
    
    
}

//MARK:- UITableViewDataSource
extension TableViewHome: UITableViewDataSource
{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return moreArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        let cell  = tableView.dequeueReusableCell(withIdentifier: "CellHome") as? CellHome
        cell?.updateData(data: moreArray.object(at: indexPath.row) as! NSMutableDictionary)
        return cell!
    }
    
}


//MARK: - UITableViewDelegate
extension TableViewHome: UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if(self.blocKCallForDidSelect != nil){
            self.blocKCallForDidSelect!(indexPath.row)
        }
    }
    
}



