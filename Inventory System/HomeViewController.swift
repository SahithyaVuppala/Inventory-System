//
//  ViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/9/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func userBTN(_ sender: AnyObject) {
        
        // Action related to user button
    }
    
    
    @IBAction func guestBTN(_ sender: AnyObject) {
        // Action related to guest
    }

    @IBAction func adminBTN(_ sender: AnyObject) {
    }
    
    @IBAction func unwindBackToHomeVC(_ sender:UIStoryboardSegue){
        //sender.sourceViewController as! AdminLoginViewController
    }

}

