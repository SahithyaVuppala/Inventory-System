//
//  UserAccountInfo.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 3/30/17.
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
    @NSManaged var adminCardName:String
    @NSManaged var adminCardNum:Int
    @NSManaged var AdminCardExpiry:String
    @NSManaged var AdminCVVno:Int
    
    
    static func parseClassName() -> String{
        return "UserAccountInfo"
    }
    
}
