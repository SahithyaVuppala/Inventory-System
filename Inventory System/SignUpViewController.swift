//
//  SignUpViewController.swift
//  Inventory System
//
//  Created by Vuppala,Sahithya on 3/30/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import Foundation
import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var nameTF: UITextField!
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    @IBOutlet weak var confirmPasswordTF: UITextField!
    
    
    @IBAction func submitBTN(_ sender: AnyObject) {
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
        if emailTest.evaluate(with: userEmail) {
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
        
        myUser.signUpInBackground( block: {
            
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
    
    
    @IBAction func cancelBTN(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage(_ userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    func displayAlertWithTitle(_ title:String, message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func displayMessage(_ theMesssage:String)
        
    {
        
        // Display alert message with confirmation.
        
        let myAlert = UIAlertController(title:"User Registration is Successful", message:theMesssage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            
            self.dismiss(animated: true, completion:nil)
            
        }
        
        myAlert.addAction(okAction)
        
        self.present(myAlert, animated:true, completion:nil)
        
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
