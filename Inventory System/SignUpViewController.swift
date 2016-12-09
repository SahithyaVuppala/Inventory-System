//
//  SignUpViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/29/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
   
    @IBAction func submitBTN(sender: AnyObject) {
        let userName = nameTF!.text
        let userEmail = emailTF!.text
        let username = usernameTF!.text
        let userPassword = passwordTF!.text
        let userConfirmPassword = confirmPasswordTF!.text
        
        if nameTF!.text!.isEmpty || emailTF!.text!.isEmpty || usernameTF!.text!.isEmpty || passwordTF!.text!.isEmpty || confirmPasswordTF!.text!.isEmpty{
            displayMyAlertMessage("All the fields are required")
            return
        }
        
        if passwordTF!.text! != userConfirmPassword! {
            displayMyAlertMessage("Passwords don't match")
            return
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        if emailTest.evaluateWithObject(userEmail) {
            // Do nothing continue forward
        }
        else {
            //emailIdValidation = false
            displayMyAlertMessage("Please Enter Valid Email ID")
            return
        }
        
        let myUser:PFUser = PFUser()
        myUser.username = username
        myUser.password = userPassword
        myUser.email = userEmail
        myUser.setObject(userName!, forKey: "Full_Name")
        
        myUser.signUpInBackgroundWithBlock( {
            
            (success, error) -> Void in
            
            if let error = error as NSError? {
                
                let errorString = error.userInfo["error"] as? NSString
                
                // In case something went wrong, use errorString to get the error
                
                self.displayAlertWithTitle("Something has gone wrong", message:"\(errorString)")
                
            } else {
                
                // Everything went okay
                
                let successMessage = "login with user credentials"
                
                self.displayMessage(successMessage)
                
                return
                
                //
                
                let emailVerified = myUser["emailVerified"]
                
                if emailVerified != nil && (emailVerified as! Bool) == true {
                    
                    // Everything is fine
                    
                    
                    
                } else {
                    
                    // The email has not been verified, so logout the user
                    
                    PFUser.logOut()
                    
                }
                
            } })
        

    }
    
    
    @IBAction func cancelBTN(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func displayMessage(theMesssage:String)
        
    {
        
        // Display alert message with confirmation.
        
        var myAlert = UIAlertController(title:"User Registration is Successful", message:theMesssage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
            
            self.dismissViewControllerAnimated(true, completion:nil)
            
        }
        
        myAlert.addAction(okAction)
        
        self.presentViewController(myAlert, animated:true, completion:nil)
        
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
