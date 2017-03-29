//
//  UserAccountInfo.swift
//  Inventory System
//
//  Created by Inventory System on 3/28/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts
class UserAccountInfo:PFObject, PFSubclassing{
    
    @NSManaged var productName:String
    @NSManaged var userName:String
    @NSManaged var accountNumber:Int
    @NSManaged var routingNumber:Int
    
    static func parseClassName() -> String{
        return "UserAccountInfo"
    }
    
}
