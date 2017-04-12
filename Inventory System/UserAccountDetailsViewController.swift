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
    
    @IBOutlet weak var cardNameTF: UITextField!
    
    @IBOutlet weak var cardNumTF: UITextField!
    
    @IBAction func addCardBTN(_ sender: UIButton) {
        
        if cardNameTF!.text!.isEmpty || cardNumTF!.text!.isEmpty{
            displayMyAlertMessage("All the fields are required")
            return
        }
        
        let cardName = cardNameTF.text!
        let cardNum = cardNumTF.text!
        
        let allowedChar = "[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]"
        let accountChar = "[A-Za-z]+"
        let charTest1 = NSPredicate(format:"SELF MATCHES %@", allowedChar)
        let charTest2 = NSPredicate(format:"SELF MATCHES %@", accountChar)
        if charTest2.evaluate(with: cardName){
            // Do nothing continue forward
        }
        else {
            //emailIdValidation = false
            displayMyAlertMessage("Please Enter Valid Card Name")
            return
        }
        
        if charTest1.evaluate(with: cardNum) {
            
        }
        else {
            //emailIdValidation = false
            displayMyAlertMessage("Please Enter Valid Card Number")
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
        
        let query = PFQuery(className:"ClientRequests")
        query.whereKey("userName", equalTo: self.uName).whereKey("productName", equalTo: self.pName)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                if let objects = objects {
                    for object in objects {
                        //print(object.objectId!)
                        query.getObjectInBackground(withId: object.objectId!) {
                            (newObject: PFObject?, error: Error?) -> Void in
                            if error != nil {
                                print(error!)
                            } else {
                                newObject?["accountStatus"] = 2
                                newObject?.saveInBackground()
                            }
                        }
                    }
                }
            }
        }

        
        let accountRequest = PFObject(className: "UserAccountInfo")
        accountRequest["productName"] = pName
        accountRequest["userName"] = AnnouncementViewController.nameOfUser
        accountRequest["cardName"] = cardName
        accountRequest["cardNum"] = cardNum
        //clientRequest["productStatus"] = 1
        accountRequest.saveInBackground(block: { (success, error) -> Void in
            if success{
                self.cardNameTF.text = ""
                self.cardNumTF.text = ""
                self.displayMyAlertMessage("Your card details has been sent successfully")
            }
        })
        
//        let query = PFQuery(className:"ClientRequests")
//        query.whereKey("userName", equalTo: self.uName).whereKey("productName", equalTo: self.pName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: Error?) -> Void in
//            
//            if error == nil {
//                if let objects = objects {
//                    for object in objects {
//                        //print(object.objectId!)
//                        query.getObjectInBackground(withId: object.objectId!) {
//                            (newObject: PFObject?, error: Error?) -> Void in
//                            if error != nil {
//                                print(error!)
//                            } else {
//                                newObject?["accountStatus"] = 2
//                                newObject?.saveInBackground()
//                            }
//                        }
//                    }
//                }
//            }
//        }
        
        

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
