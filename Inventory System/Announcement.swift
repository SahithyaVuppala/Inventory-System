//
//  Announcement.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/29/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import Foundation

class Announcement{
    var name:String
    var quandity:Int
    var price:Double
    init(name:String, quandity:Int, price:Double){
        self.name = name
        self.quandity = quandity
        self.price = price
    }
}