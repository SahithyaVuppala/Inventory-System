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
    class func retrieveProducts(){
        let query = PFQuery(className: "Announcements")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            if error == nil {
                ParseOperaions.allProducts = objects as! [Announcements]
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
    
}

