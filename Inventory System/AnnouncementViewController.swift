//
//  AnnouncementViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
let fileName = "/ShippingReceipt.txt"
let pathToFile = documentsFolder.appending(fileName)

class AnnouncementViewController: UIViewController {

    
    @IBOutlet weak var numberOfItemsTF: UITextField!

    @IBOutlet weak var productDescriptionTV: UITextView!
    
    @IBOutlet weak var totalNoOfProducts: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    var numberOfProducts:Int = Int()
    var aboutProduct:String = String()
    var nameOfProduct:String = String()
    static var nameOfUser:String = String()
    var imageProduct:UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productDescriptionTV.text = aboutProduct
        totalNoOfProducts.text = String(numberOfProducts)
        productImage.image = imageProduct
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkRequest() -> Bool {
        var flag:Bool = false
        var checkArray:[Bool] = []
        for productObject in ParseOperaions.allRequests{
            if productObject.productName == self.nameOfProduct && productObject.userName == AnnouncementViewController.nameOfUser {
                flag = true
                checkArray.append(flag)
            }
            else{
                flag = false
                checkArray.append(flag)
            }
        }
        if checkArray.contains(true){
            flag = true
        }
        else{
            flag = false
        }
        return flag
    }
    
    
    @IBAction func requestBTN(_ sender: AnyObject) {
        
        let userEnteredValue:Int? = Int(numberOfItemsTF.text!)
        if userEnteredValue == nil || userEnteredValue! < 0 || userEnteredValue! > numberOfProducts{
            displayMessage("Invalid value")
        }
        else{
            
            if checkRequest() {
                displayMessage("You already requested for this product")
            }
            else{
                let clientRequest = PFObject(className: "ClientRequests")
                clientRequest["productName"] = self.nameOfProduct
                clientRequest["userName"] = AnnouncementViewController.nameOfUser
                clientRequest["productQuandity"] = userEnteredValue
                //clientRequest["productStatus"] = 1
                clientRequest.saveInBackground(block: { (success, error) -> Void in
                    if success{
                        ParseOperaions.retrieveRequests()
                    }
                })
                displayMessage("Your Request has been submitted")
            }
            
        }
        
        var productName = self.nameOfProduct
        var userName = AnnouncementViewController.nameOfUser
        
        var textFile = "The item has been shipped: \(productName), \(userName)"
        
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: pathToFile) {
        
            var writeError:NSError?
            
            do{
                let fileToBeWritten = try textFile.write(toFile: pathToFile, atomically: true, encoding: String.Encoding.utf8)
            
            if writeError == nil {
                print("No problems, we could save the file and the content was \(textFile)")
            }else{
                print("We encountered an error and this error is \(writeError)")
            }
            }catch{
                print("\(writeError)")
            }
        }else {
            print("File was already there")
        }
        
    }
    
    
    func displayMessage(_ message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .alert)
        if message == "Your Request has been submitted"{
            
            let defaultAction = UIAlertAction(title:"OK", style: .default) {(_) -> Void in
                self.dismiss(animated: true, completion: nil)}
            alert.addAction(defaultAction)

        }
        else{
            
            let defaultAction = UIAlertAction(title:"OK", style: .default, handler: nil)
            alert.addAction(defaultAction)

        }
        
        self.present(alert,animated:true, completion:nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
