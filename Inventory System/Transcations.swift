//
//  Transcations.swift
//  Inventory System
//
//  Created by Manoj Kumar Kotte on 2/22/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation
import Parse
import Bolts
class Transcations:PFObject, PFSubclassing{
    
    @NSManaged var productName:String
    @NSManaged var userName:String
    @NSManaged var requestedQuantity:Int
    @NSManaged var billImage:String
    
    static func parseClassName() -> String{
        return "Transcations"
    }
    
}
