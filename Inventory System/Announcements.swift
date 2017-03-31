//
//  Announcements.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 12/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts
class Announcements:PFObject, PFSubclassing {
    
    @NSManaged var name:String
    @NSManaged var productDescription:String
    @NSManaged var quantity:Int
    @NSManaged var price:Int
    @NSManaged var image:String
    
    static func parseClassName() -> String {
        return "Announcements"
    }
    
}
