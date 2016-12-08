//
//  ForgotPasswordViewController.swift
//  NWMSU_Forum
//
//  Created by  on 10/28/16.
//  Copyright © 2016 Putchala,Venkata Naga Kiran. All rights reserved.
//

import UIKit
import Parse
import Bolts

class ForgotPasswordViewController: UIViewController {

  
    @IBOutlet weak var emailIdTF: UITextField!
    
  
    @IBAction func closeFgtPwdBTN(sender: AnyObject) {
        
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
    
    
    @IBAction func resetPwdBTN(sender: AnyObject) {
        
        let userEmail = emailIdTF.text!
        PFUser.requestPasswordResetForEmailInBackground(userEmail) {
            (success:Bool, error:NSError?) -> Void in
            
            if(success)
            {
                let successMessage = "Email message was sent to you at \(userEmail)"
                self.displayMessage(successMessage)
                return
            }
            
            if(error != nil)
            {
                let errorMessage:String = error!.userInfo["error"] as! String
                self.displayMessage(errorMessage)
            }
        }
    }

    
    func displayMessage(theMesssage:String)
    {
        // Display alert message with confirmation.
        var myAlert = UIAlertController(title:"Alert", message:theMesssage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion:nil)
        }
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated:true, completion:nil)
    }

}
