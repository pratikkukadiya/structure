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
        
        //self.setAppearanceOfNavigationBar()
        
        self.title = AppTitle.Home
  
     
        self.doSetUpScreen()
    }
    
    
    //MARK: - Functions
    //MARK: -
    
    func doSetUpScreen()  {
        
        tableHome.blocKCallForDidSelect = { (selectedIndex) in
            
            print(selectedIndex)
            
        }
        
        
    }
    

    //MARK: - Buttons Actions
    //MARK: -
    @IBAction func btnNextClick(_ sender: Any) {
        
        self.pushTo("SecondViewController")
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

