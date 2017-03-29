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
    
  
    @IBAction func closeFgtPwdBTN(_ sender: AnyObject) {
        
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
    
    
    @IBAction func resetPwdBTN(_ sender: AnyObject) {
        
        let userEmail = emailIdTF.text!
//        PFUser.requestPasswordResetForEmail(inBackground: userEmail) {
//            (success:Bool, error:NSError?) -> Void in
//            
//            if(success)
//            {
//                let successMessage = "Email message was sent to you at \(userEmail)"
//                self.displayMessage(successMessage)
//                return
//            }
//            
//            if(error != nil)
//            {
//                let errorMessage:String = error!.userInfo["error"] as! String
//                self.displayMessage(errorMessage)
//            }
//        }
    }

    
    func displayMessage(_ theMesssage:String)
    {
        // Display alert message with confirmation.
        let myAlert = UIAlertController(title:"Alert", message:theMesssage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.default){ action in
            self.dismiss(animated: true, completion:nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated:true, completion:nil)
    }

}
