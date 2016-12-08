//
//  PromptViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class PromptViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var userNameTF: UITextField!
   
    
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    
    @IBAction func submitBTN(sender: AnyObject) {
         //Action related to submit button
        if userNameTF.text == "" || passwordTF.text == "" {
                    displayMyAlertMessage("Inavlid User name or Password")
        }
        
        let userName = userNameTF!.text
        let userPassword = passwordTF!.text
        
        if userName!.isEmpty || userPassword!.isEmpty {
            
            displayMyAlertMessage("All the fields are required")
            return
        }
        
        PFUser.logInWithUsernameInBackground(userNameTF.text!, password: passwordTF.text!, block: {(user, error) -> Void in
            
            if error != nil{
                print(error)
                self.displayAlertWithTitle("Login Failed", message:"Please try logging in again")
            }
            else {
                
//                let emailVerified = user!["emailVerified"]
//                if emailVerified != nil && (emailVerified as! Bool) == true {
//
                self.performSegueWithIdentifier("tabBarSegue", sender: nil)
//                if let destinationTabBar = tabBarSegue.destinationViewController as? UITabBarController {
//                    
//                                    destinationTabBar.viewControllers?.removeAtIndex(2)
//                                    destinationTabBar.viewControllers?.removeAtIndex(3)
//                                    
//                                }
                
//                    let myStory:UIStoryboard = UIStoryboard(name: "Main", bundle :nil)
//                
//                  let featureVC:FeaturedViewController = myStory.instantiateViewControllerWithIdentifier("feature") as! FeaturedViewController
//                let historyVC:HistoryViewController = myStory.instantiateViewControllerWithIdentifier("history") as! HistoryViewController
//                let destinationVC = self.tabBarController?.setViewControllers([featureVC,historyVC], animated: true)
//                
//                self.showViewController(featureVC, sender: user)
//                }else{
//                    // The email has not been verified, so logout the user
//                    self.displayAlertWithTitle("Login Failed", message:"Please verify your Email Id")
//                }
                }
            
        })
        
        
    
    }
    
//    func
    
    @IBAction func forgotBTN(sender: AnyObject) {
        // Action related to forgot password button
        }
    
    @IBAction func unwindSegueLogout(sender: UIStoryboardSegue){
        let logoutView = sender.sourceViewController as! FeaturedViewController
        userNameTF!.text = ""
        passwordTF!.text = ""
    }

    @IBAction func newUserBTN(sender: AnyObject) {
        // Action related to new user button
    }
        
    func displayMyAlertMessage(userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
        
    }
    
    func displayAlertWithTitle(title:String, message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }

    @IBAction func unwindFromForgotPassword(sender:UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "tabBarSegue"{
            
            if let destinationTabBar = segue.destinationViewController as? UITabBarController {
                
                destinationTabBar.viewControllers?.removeAtIndex(3)
                destinationTabBar.viewControllers?.removeAtIndex(2)
                
            }
        }
        }
}