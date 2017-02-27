//
//  ViewController.swift
//  Inventory System
//
//  Created by Manoj Kumar Kotte on 1/1/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class HandleRequestViewController: UIViewController {
    
    @IBOutlet weak var requestedProductIMG: UIImageView!
    
    @IBOutlet weak var requestedProductName: UILabel!
    
    
    @IBOutlet weak var requestedUserName: UILabel!
    
    
    @IBOutlet weak var requestedQunadityNeeded: UILabel!
    
    var productName = String()
    var userName = String()
    var quantity = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestedProductName.text = productName
        requestedUserName.text = userName
        requestedQunadityNeeded.text = String(quantity)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func accpetBTN(_ sender: Any) {
        
        let alert:UIAlertController = UIAlertController(title: "Alert", message: "Are you sure to accept tis request!", preferredStyle: .alert)
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .default, handler: {
            (ACTION:UIAlertAction!) in
            let query = PFQuery(className:"ClientRequests")
            query.whereKey("userName", equalTo: self.userName).whereKey("productName", equalTo: self.productName)
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
                                    BillingViewController.address = "800 University Drive, 64468"
                                    newObject?["productStatus"] = 1
                                    newObject?.saveInBackground()
                                }
                            }
                        }
                    }
                    
                    
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error?.localizedDescription)")
                }
            }
            
            let newQuery = PFQuery(className:"Announcements")
            newQuery.whereKey("name", equalTo: self.productName)
            newQuery.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    if let objects = objects {
                        for object in objects {
                            //print(object.objectId!)
                            newQuery.getObjectInBackground(withId: object.objectId!) {
                                (newObject: PFObject?, error: Error?) -> Void in
                                if error != nil {
                                    print(error!)
                                } else {
                                    //                                print("Original quantity is",object["quantity"])
                                    let quan = object["quantity"] as! Int
                                    newObject?["quantity"] = quan - self.quantity
                                    newObject?.saveInBackground()
                                    ParseOperaions.retrieveRequests()
                                }
                            }
                        }
                    }
                    
                    
                } else {
                    // Log details of the failure
                    print("Error: \(error!) \(error?.localizedDescription)")
                }
            }
            self.dismiss(animated: true, completion: nil)
            ParseOperaions.retrieveRequests()
        })
        
        let cancelAction = UIAlertAction(title:"Cancel", style: .default, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func deleteAnnouncements(quan:Int, pName:String, uName:String){
        let query = PFQuery(className: "ClientRequests")
        query.whereKey("productName", equalTo: pName).whereKey("userName", equalTo: uName)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                
                DispatchQueue.global(qos: .userInitiated).async {
                    
                    DispatchQueue.main.async {
                        objects?[0].deleteEventually()
                        //NotificationCenter.default.post(name: Notification.Name(rawValue: "Data updated"), object: nil)
                        ParseOperaions.retrieveRequests()
                    }
                    //                    objects?[0].deleteEventually()
                }
                
                //                dispatch_async(dispatch_get_main_queue()) {
                //
                //                }
                //                DispatchQueue.main.asynchronously() {
                //                    objects?[0].deleteEventually()
                //                }
                
                ParseOperaions.retrieveRequests()
            }
        }
    }
    
    
    @IBAction func declineBTN(_ sender: Any) {
        displayAlertWithTitle("Delete", message: "Are you sure to delete this request")
        //updateAnnouncements(quan: quantity, pName: productName, uName: userName)
        
    }
    
    
    func displayAlertWithTitle(_ title:String, message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .default, handler: {
            (ACTION:UIAlertAction!) in self.deleteAnnouncements(quan: self.quantity, pName: self.productName, uName: self.userName)
            self.dismiss(animated: true, completion: nil)
            ParseOperaions.retrieveRequests()
        })
        let cancelAction = UIAlertAction(title:"Cancel", style: .default, handler: nil)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
