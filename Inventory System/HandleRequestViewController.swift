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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func accpetBTN(_ sender: Any) {
//        for productObject in ParseOperaions.allRequests{
//            if productObject.productName == productName && productObject.userName == userName{
////                productObject.productQuandity -= quandity
//                updateAnnouncements(quan: productObject.productQuandity, pName: productObject.productName, uName: productObject.userName)
//                //newUpdate(id: productObject.objectId!)
//            }
//        }
        
        
        
     

//        query.getObjectWithId("name")  { (object:PFObject, error: Error?) -> Void in
//            if object != nil && error == nil{
//                object!["quandity"] = 2
//                object!.saveInBackground()
//            }
//            
//        }
        
       
    }
    
    func updateAnnouncements(quan:Int, pName:String, uName:String){
        let query = PFQuery(className: "ClientRequests")
        query.whereKey("productName", equalTo: pName).whereKey("userName", equalTo: uName)
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {

                //objects?[0].deleteEventually()
                
                let newquery = PFQuery(className: "Announcements")
                newquery.whereKey("name", equalTo: pName)
                newquery.findObjectsInBackground {
                    (newobjects: [PFObject]?, error: Error?) -> Void in
                    if error == nil {
                        newobjects?[0].deleteEventually()
                        
//                        print("Value: ",newobjects?[0]["quantity"])
//                        newobjects?[0]["quantity"] = 500
                    }
                }
            }
        }
    }
    
    func newUpdate(id:String){
        let query = PFQuery(className: "Announcements")
        do {
            let object = try query.getObjectWithId(id)
            query.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                if error == nil {
                    print("Done")
                }
            }
            object["quantity"] = 999
            object.saveInBackground()
            
        }
        catch{
            print("Some thing went wrong")
        }

    }
    
    
    @IBAction func declineBTN(_ sender: Any) {
        
    }

}
