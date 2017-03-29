//
//  ParseOperations.swift
//  Inventory System
//
//  Created by Manoj Kumar Kotte on 12/29/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import UIKit
import Parse
import Bolts
class ParseOperaions{
    
    // Used to retrieve the data from announcements table and will be displayed in corresponding tables
    static var allProducts:[Announcements] = []
    //static var allImages:[UIImage] = []
    static var productImages:[UIImage] = []
    class func retrieveProducts(){
        
        let query = PFQuery(className: "Announcements")
        query.findObjectsInBackground {
            
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                //print("Outer loop")
                ParseOperaions.allProducts = objects as! [Announcements]
                
                
//                if let returnedObjects = objects{
//                    
//                    allImages = []
//                    
//                    for object in returnedObjects{
//                        print("Inner loop")
//                        let thumbNail = object["image"] as! PFFile
//                        thumbNail.getDataInBackground(block: {
//                            (imageData, error) -> Void in
//                            
//                            if (error == nil) {
//                                print("Inside the loop")
//                                let image = UIImage(data:imageData!)
//                                self.allImages.append(image!)
//                                
//                            }
//                        })
//                    }
//                }
                
                
            }
        }
        
    }
    
    // Used to retrieve the data from the client requests table
    static var allRequests:[ClientRequests] = []
    class func retrieveRequests(){
        let query = PFQuery(className: "ClientRequests")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                ParseOperaions.allRequests = objects as! [ClientRequests]
            }
        }
    }
    
    class func retrieveImages(){
        let query = PFQuery(className: "Announcements")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                if let returnedObjects = objects{
                    for object in returnedObjects{
                        let thumbnail = object["image"] as! PFFile
                        thumbnail.getDataInBackground(block: {
                        (imageData, error) -> Void in
                            if (error == nil){
                                let image = UIImage(data:imageData!)
                                self.productImages.append(image!)
                            }
                            
                        })
                    }
                }
            }
        }
    }
    
}

