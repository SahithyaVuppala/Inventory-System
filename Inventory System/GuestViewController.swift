//
//  GuestViewController.swift
//  Inventory System
//
//  Created by Vuppala,Sahithya on 3/30/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import UIKit

class GuestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBTN = UIBarButtonItem()
        backBTN.title = "Back"
        navigationItem.backBarButtonItem = backBTN
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
    @IBAction func joinUsBtn(_ sender: Any) {
    
        // action to join the application
     
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
