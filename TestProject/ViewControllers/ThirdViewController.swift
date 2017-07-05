//
//  ThirdViewController.swift
//  TestProject
//
//  Created by Govind ravaliya on 02/07/17.
//  Copyright © 2017 Govind ravaliya.ShareAd. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backClick(_ sender: Any) {
        self.popTo()
        
    }

    @IBAction func nextClick(_ sender: Any) {
    
        self.pushTo("ForthViewController")
    }
    
    @IBAction func backToRoot(_ sender: Any) {
    
        self.popToRoot()
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
