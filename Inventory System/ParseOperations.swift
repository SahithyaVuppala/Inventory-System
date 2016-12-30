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
}


////
////  ParseOperations.swift
////  BearcatHealth
////
////  Created by Pachipulusu,Venkatakotianilkumar on 11/8/16.
////  Copyright © 2016 Gayam,Prathibha. All rights reserved.
////  This class contains code for various database operations
//import UIKit
//import Bolts
//import Parse
//class ParseOperations {
//    // MARK: - Properties
//    // Data for breakfast,lunch,dinner and latenight view controllers
//    static var breakfastData:[FoodData] = []
//    static var lunchData:[FoodData] = []
//    static var dinnerData:[FoodData] = []
//    static var lateNightData:[FoodData] = []
//    var user : [Profile] = []
//    // Data for favorites view controller
//    var favoriteBreakfast:[FavoritesData] = []
//    var favoriteLunch:[FavoritesData] = []
//    var favoriteDinner:[FavoritesData] = []
//    var favoriteLateNight:[FavoritesData] = []
//    // Calori Intake Variables
//    var breakfastIntake:[CaloriesData] = []
//    var lunchIntake:[CaloriesData] = []
//    var dinnerIntake:[CaloriesData] = []
//    var lateNightIntake:[CaloriesData] = []
//    // MARK: - Database operations(Methods)
//    // Retrieves data from Food data table and if it is breakfast
//    static func retrieveBreakFastMenu(){
//        let query = PFQuery(className:"FoodData")
//        query.whereKey("mealType", equalTo:"Breakfast")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                ParseOperations.breakfastData = objects as! [FoodData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Breakfast Is Served"), object: nil)
//            }
//        }
//    }
//    // Retrives data from Food data table and if it is Lunch
//    static func retrieveLunchMenu()  {
//        let query = PFQuery(className:"FoodData")
//        query.whereKey("mealType", equalTo:"Lunch")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                
//                ParseOperations.lunchData = objects as! [FoodData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Lunch Is Served"), object: nil)
//            }
//        }
//    }
//    // Retrives data from Food data table and if it is Dinner
//    static func retrieveDinnerMenu() {
//        let query = PFQuery(className:"FoodData")
//        query.whereKey("mealType", equalTo:"Dinner")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                ParseOperations.dinnerData = objects as! [FoodData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Dinner Is Served"), object: nil)
//            }
//        }
//    }
//    // Retrives data from Food data table and if it is LateNight
//    static func retrieveLateNightMenu()  {
//        let query = PFQuery(className:"FoodData")
//        query.whereKey("mealType", equalTo:"Late Night")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                ParseOperations.lateNightData = objects as! [FoodData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "lateNight Is Served"), object: nil)
//            }
//        }
//    }
//    // Fetches the data from favorites table for breakfast
//    func retrieveFavoriteBreakFastMenu(_ userName :String){
//        let query = PFQuery(className:"FavoritesData")
//        query.whereKey("mealType", equalTo:"Breakfast")
//        query.whereKey("sid", equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.favoriteBreakfast = objects as! [FavoritesData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Favorites Breakfast Is Served"), object: nil)
//            }
//        }
//    }
//    // Fetches the data from favorites table for Lunch
//    func retrieveFavoriteLunchMenu(_ userName :String) {
//        let query = PFQuery(className:"FavoritesData")
//        query.whereKey("mealType", equalTo:"Lunch")
//        query.whereKey("sid", equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.favoriteLunch = objects as! [FavoritesData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Favorites Lunch Is Served"), object: nil)
//            }
//        }
//    }
//    // Fetches the data from favorites table for Dinner
//    func retrieveFavoriteDinnerMenu(_ userName :String)  {
//        let query = PFQuery(className:"FavoritesData")
//        query.whereKey("mealType", equalTo:"Dinner")
//        query.whereKey("sid", equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.favoriteDinner = objects as! [FavoritesData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Favorites Dinner Is Served"), object: nil)
//            }
//        }
//    }
//    // Fetches the data from favorites table for LateNight
//    func retrieveFavoriteLateNightMenu(_ userName :String) {
//        let query = PFQuery(className:"FavoritesData")
//        query.whereKey("mealType", equalTo:"Late Night")
//        query.whereKey("sid", equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.favoriteLateNight = objects as! [FavoritesData]
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Favorites LateNight Is Served"), object: nil)
//            }
//        }
//    }
//    //Allows to delete food items from favouritedata table and if it is breakfast and selected item
//    func deleteFavoriteBreakfast(_ itemName:String , userName :String) {
//        let query = PFQuery(className: "FavoritesData")
//        query.whereKey("itemName", equalTo: itemName).whereKey("mealType", equalTo:"Breakfast").whereKey("sid" , equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                for object in objects! {
//                    object.deleteEventually()
//                }
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "It's Not Tasty"), object: nil)
//            }
//        }
//    }
//    //Allows to delete food items from favouritedata table and if it is lunch selected item
//    
//    func deleteFavoriteLunch(_ itemName:String, userName :String) {
//        let query = PFQuery(className: "FavoritesData")
//        query.whereKey("itemName", equalTo: itemName).whereKey("mealType", equalTo:"Lunch").whereKey("sid" , equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                for object in objects! {
//                    object.deleteEventually()
//                }
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "It's Not Tasty"), object: nil)
//            }
//        }
//    }
//    //Allows to delete food items from favouritedata table and if it is  dinner selected item
//    
//    func deleteFavoriteDinner(_ itemName:String, userName :String) {
//        let query = PFQuery(className: "FavoritesData")
//        query.whereKey("itemName", equalTo: itemName).whereKey("mealType", equalTo:"Dinner").whereKey("sid" , equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                for object in objects! {
//                    object.deleteEventually()
//                }
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "It's Not Tasty"), object: nil)
//            }
//        }
//    }
//    //Allows to delete food items from favouritedata table and if it is lastnight selected item
//    
//    func deleteFavoriteLateNight(_ itemName:String, userName :String) {
//        let query = PFQuery(className: "FavoritesData")
//        query.whereKey("itemName", equalTo: itemName).whereKey("mealType", equalTo:"Late Night").whereKey("sid" , equalTo:userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                for object in objects! {
//                    object.deleteEventually()
//                }
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "It's Not Tasty"), object: nil)
//            }
//        }
//    }
//    //Allows to save favourite beakfast food items into Favoritesdata table
//    func saveFvaoriteBreakfastdata(_ favorites: FavoritesData) {
//        favorites.saveInBackground(block: { (success, error) -> Void in
//            if success {
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Added to Favorites"), object: nil)
//            }
//        })
//    }
//    //Allows to save favourite lunch food items Favoritesdata table
//    func saveFvaoriteLunchdata(_ favorites: FavoritesData) {
//        favorites.saveInBackground(block: { (success, error) -> Void in
//            if success {
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Added to Favorites"), object: nil)           }
//        })
//    }
//    //Allows to save favourite dinner food items Favoritesdata table
//    func saveFvaoriteDinnerdata(_ favorites: FavoritesData) {
//        favorites.saveInBackground(block: { (success, error) -> Void in
//            if success {
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Added to Favorites"), object: nil)
//            }
//        })
//    }
//    //Allows to save favourite Latenight food items Favoritesdata table
//    func saveFvaoriteLateNightdata(_ favorites: FavoritesData) {
//        favorites.saveInBackground(block: { (success, error) -> Void in
//            if success {
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Added to Favorites"), object: nil)
//            }
//        })
//    }
//    //Allows us to retrieve the user details for profile view controller
//    func retrieveUser(_ userName :String)  {
//        let query = PFQuery(className:"Profile")
//        query.whereKey("sid", equalTo: userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.user = objects as! [Profile]
//            }
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "User retrived"), object: nil)
//        }
//    }
//    //save the number of calories consumed
//    func saveCalorieIntake(_ intake: CaloriesData) {
//        intake.saveInBackground(block: {(success,error) -> Void in
//            if success {
//                NotificationCenter.default.post(name: Notification.Name(rawValue: "Added to CaloriIntake"), object: nil)
//            }
//        })
//    }
//    //Allows us to retrieve the number of calories consumed in breakfast
//    func retrieveBreakfastCalorieIntake(_ userName:String) {
//        let query = PFQuery(className: "CaloriesData")
//        query.whereKey("sid", equalTo: userName)
//        query.whereKey("mealType", equalTo:"Breakfast")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.breakfastIntake = objects as! [CaloriesData]
//            }
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "User breakfast calories retrived"), object: nil)
//        }
//    }
//    //Allows us to retrieve the number of calories consumed in lunch
//    func retrieveLunchCalorieIntake(_ userName:String) {
//        let query = PFQuery(className: "CaloriesData")
//        query.whereKey("sid", equalTo: userName)
//        query.whereKey("mealType", equalTo:"Lunch")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.lunchIntake = objects as! [CaloriesData]
//            }
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "User lunch calories retrived"), object: nil)
//        }
//    }
//    //Allows us to retrieve the number of calories consumed in dinner
//    func retrieveDinnerCalorieIntake(_ userName:String) {
//        let query = PFQuery(className: "CaloriesData")
//        query.whereKey("sid", equalTo: userName)
//        query.whereKey("mealType", equalTo:"Dinner")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.dinnerIntake = objects as! [CaloriesData]
//            }
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "User dinner calories retrived"), object: nil)
//        }
//    }
//    //Allows us to retrieve the number of calories consumed in late night
//    func retrieveLateNightCalorieIntake(_ userName:String) {
//        let query = PFQuery(className: "CaloriesData")
//        query.whereKey("sid", equalTo: userName)
//        query.whereKey("mealType", equalTo:"Late Night")
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                self.lateNightIntake = objects as! [CaloriesData]
//            }
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "User latenight calories retrived"), object: nil)
//        }
//    }
//    //Allows to clear the calorie consumed by the user
//    func clearIntake(_ userName:String) {
//        let query = PFQuery(className: "CaloriesData")
//        query.whereKey("sid", equalTo: userName)
//        query.findObjectsInBackground {
//            (objects: [PFObject]?, error: NSError?) -> Void in
//            if error == nil {
//                for object in objects! {
//                    object.deleteEventually()
//                }
//            }
//        }
//    }
//}
//
//
//
//
//
