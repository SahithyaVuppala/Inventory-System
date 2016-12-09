//
//  AdminLoginViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 12/8/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class AdminLoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBAction func submitBTN(sender: AnyObject) {
        
        let username = usernameTF.text!
        
        let password = passwordTF.text!
        
        
        
        if username.isEmpty && password.isEmpty{
            
            displayAlertWithTitle("Text Fields are empty", message: "Please enter username and password")
            
        }
        
        if username == "admin" && password == "admin" {
            
            
            
            self.performSegueWithIdentifier("adminLoginSegue", sender: nil)
            
            
            
        } else{
            
            displayAlertWithTitle("Invalid Credentials", message: "Please provide valid username or password")
            
        }
        
    }

    @IBAction func forgotPasswordBTN(sender: AnyObject){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using segue.destinationViewController.
        
        // Pass the selected object to the new view controller.
        
        
        
        if segue.identifier == "adminLoginSegue"{
            
            
            
            if let destinationTabBar = segue.destinationViewController as? UITabBarController {
                
                
                
                destinationTabBar.viewControllers?.removeAtIndex(1)
                
                destinationTabBar.viewControllers?.removeAtIndex(0)
                
                
                
            }
            
        }
        
    }
    
    
    
    func displayAlertWithTitle(title:String, message:String){
        
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alert.addAction(defaultAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    

}
