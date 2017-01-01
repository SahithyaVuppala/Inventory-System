//
//  ClientRequests.swift
//  Inventory System
//
//  Created by Manoj Kumar Kotte on 12/30/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts

class ClientRequests:PFObject, PFSubclassing {
    
    @NSManaged var productName:String
    @NSManaged var userName:String
    @NSManaged var productQuandity:Int
    
    static func parseClassName() -> String {
        return "ClientRequests"
    }
    
}
