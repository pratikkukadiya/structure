//
//  ForthViewController.swift
//  TestProject
//
//  Created by Govind ravaliya on 02/07/17.
//  Copyright © 2017 Govind ravaliya.ShareAd. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backtoroot(_ sender: Any) {
        
        self.popToRoot()
        
    }

    @IBAction func backClcik(_ sender: Any) {
        
        self.popTo()
        
    }
    
    @IBAction func backToSecond(_ sender: Any) {
    
        self.popToViewController("SecondViewController")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
