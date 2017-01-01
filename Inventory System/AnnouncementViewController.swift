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


class AnnouncementViewController: UIViewController {

    
    @IBOutlet weak var numberOfItemsTF: UITextField!

    @IBOutlet weak var productDescriptionTV: UITextView!
    
    @IBOutlet weak var totalNoOfProducts: UILabel!
    
    @IBOutlet weak var productImage: UIImageView!
    var numberOfProducts:Int = Int()
    var aboutProduct:String = String()
    var nameOfProduct:String = String()
    static var nameOfUser:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        productDescriptionTV.text = aboutProduct
        totalNoOfProducts.text = String(numberOfProducts)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestBTN(_ sender: AnyObject) {
        
        let userEnteredValue:Int? = Int(numberOfItemsTF.text!)
        if userEnteredValue == nil || userEnteredValue! < 0 || userEnteredValue! > numberOfProducts{
            displayMessage("Invalid value")
        }
        else{
            let clientRequest = PFObject(className: "ClientRequests")
            clientRequest["productName"] = self.nameOfProduct
            clientRequest["userName"] = AnnouncementViewController.nameOfUser
            clientRequest["productQuandity"] = userEnteredValue
            clientRequest.saveInBackground(block: { (success, error) -> Void in
                if success{
                    ParseOperaions.retrieveRequests()
                }
            })
            displayMessage("Your Request has been submitted")
        }
        
    }
    
    
    func displayMessage(_ message:String) {
        let alert = UIAlertController(title: "", message: message,
                                      preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:"OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
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
