//
//  UserAccountDetailsViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 3/30/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class UserAccountDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var pName:String = String()
    var uName:String = String()
    
    @IBOutlet weak var accountNumTF: UITextField!
    
    @IBOutlet weak var routingNo: UITextField!
    
    @IBAction func submitBTN(_ sender: UIButton) {
        
        if accountNumTF!.text!.isEmpty || self.routingNo!.text!.isEmpty{
            displayMyAlertMessage("All the fields are required")
            return
        }
        
        let accountNo = accountNumTF.text!
        let routingNum = self.routingNo.text!
        
        let allowedChar = "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
        let accountChar = "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
        let charTest1 = NSPredicate(format:"SELF MATCHES %@", allowedChar)
        let charTest2 = NSPredicate(format:"SELF MATCHES %@", accountChar)
        if charTest2.evaluate(with: accountNo){
            // Do nothing continue forward
        }
        else {
            //emailIdValidation = false
            displayMyAlertMessage("Please Enter Valid account number")
            return
        }
        
        if charTest1.evaluate(with: routingNum) {
            
        }
        else {
            //emailIdValidation = false
            displayMyAlertMessage("Please Enter Valid routing number")
            return
        }
        
        //        if accountNo! < 0 || accountNo! >9 || userEnteredValue! > numberOfProducts{
        //            displayMessage("Invalid value")
        //        }
        //        else{
        //
        //            if checkRequest() {
        //                displayMessage("You already requested for this product")
        //            }
        //            else{
        let accountRequest = PFObject(className: "UserAccountInfo")
        accountRequest["productName"] = pName
        accountRequest["userName"] = AnnouncementViewController.nameOfUser
        accountRequest["accountNumber"] = accountNo
        accountRequest["routingNumber"] = routingNum
        //clientRequest["productStatus"] = 1
        accountRequest.saveInBackground(block: { (success, error) -> Void in
            if success{
                self.displayMyAlertMessage("Your account information has been sent successfully")
            }
        })
        

    }
    
    @IBAction func cancelBTN(_ sender: UIButton) {
    }
    
    func displayMyAlertMessage(_ userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
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
