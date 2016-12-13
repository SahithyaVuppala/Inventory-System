//
//  NewAnnouncementViewController.swift
//  New
//
//  Created by Kotte,Manoj Kumar on 11/6/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class NewAnnouncementViewController: UIViewController {
    
    @IBOutlet weak var productNameTF: UITextField!
    
    @IBOutlet weak var productDescriptionTF: UITextField!

    @IBOutlet weak var quantityTF: UITextField!
    
    @IBOutlet weak var imageTF: UITextField!
    
    override func viewDidLoad() {
        self.navigationItem.title = "Add Product"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AddBTN(sender: AnyObject) {
        
        let announcement = PFObject(className: "Announcements")
        announcement["name"] = productNameTF.text
        announcement["productDescription"] = productDescriptionTF.text
        announcement["quantity"] = Int(quantityTF.text!)!
        announcement["image"] = imageTF.text
        
        announcement.saveInBackgroundWithBlock({ (success, error) -> Void in
            if success {
                self.displayAlertWithTitle("Success!",
                    message:"Announcement saved.")
            } else {
                print(error)
            }
        })
        
    }
    
    func displayAlertWithTitle(title:String, message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(defaultAction)
        self.presentViewController(alert, animated: true, completion: nil)
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
