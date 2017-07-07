//
//  ViewController.swift
//  swidt_Struct
//
//  Created by Govind ravaliya on 03/05/17.
//  Copyright © 2017 Govind ravaliya.ShareAd. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    
    
    @IBOutlet var tableHome: TableViewHome!
    //MARK: - viewDidLoad
    //MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.doSetUpScreenNavigationBar()
        self.doSetUpScreen()
    
    }
    
    
    //MARK: - Functions
    //MARK: -
    
    func doSetUpScreenNavigationBar() {
        
        self.title = AppTitle.Home
        self.setDefaultLeftSideButotnWithImage()
        self.setRightBarButtonTitle(Name: "Next", selector: #selector(self.btnNextClick(_:)))
        
    }
    
    func doSetUpScreen()  {
        
        tableHome.blocKCallForDidSelect = { (selectedIndex) in
            print(selectedIndex)
        }
        
        
        let json: [String: Any] = ["title": "ABC",
                                   "dict": ["1":"First", "2":"Second"]]
        
        
        UtilityManager.apiCaling(urlStr: "http://httpbin.org/post", jsonData: json) { (response, isSuccess) in
            
            let dictObj = response as! NSMutableDictionary
            dictObj.object(forKey: "files")
            
        }
        
        
    }
    
    

    //MARK: - Buttons Actions
    //MARK: -
    @IBAction func btnNextClick(_ sender: Any) {
        
     //   self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController"))!, animated: true)
        
        self.pushTo("SecondViewController")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

