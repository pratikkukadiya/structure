//
//  SecondViewController.swift
//  TestProject
//
//  Created by Govind ravaliya on 02/07/17.
//  Copyright © 2017 Govind ravaliya.ShareAd. All rights reserved.
//

import UIKit

class SecondViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.doSetUpScreen()
        self.doSetUpScreenNavigationBar()
        
    }

    
    //MARK: - Functions
    //MARK: -
    
    func doSetUpScreenNavigationBar() {
        
        self.title = AppTitle.Second
        self.setDefaultLeftSideButotnWithImage()
        self.setRightBarButtonTitle(Name: "Next", selector: #selector(self.btnNextClick(_:)))
        
    }
    
    func doSetUpScreen()  {
        
        
    }
    
    
    //MARK: - Buttons Actions
    //MARK: -
    
    
    @IBAction func btnNextClick(_ sender: Any) {
        
        
        self.pushTo("ThirdViewController")
    }

    @IBAction func btnBack(_ sender: Any) {
        
        self.popTo()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

}
