//
//  BillingViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class BillingViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var billingTA: UITextView!
    
    //var productName:String = ""
    
    @IBOutlet weak var shipLBL: UILabel!

    @IBOutlet weak var imageIV: UIImageView!
    
    var pName:String = String()
    var uName:String = String()
    var rQuantity:Int = Int()
    var cRequests:[ClientRequests] = []
    var rowNumber:Int = Int()
    static var address:String = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        ParseOperaions.retrieveRequests()
        cRequests = ParseOperaions.allRequests
        //rQuantity =
        shipLBL.text = BillingViewController.address
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadBillBTN(_ sender: Any) {
        
        
        let myActionSheet = UIAlertController(title: "Select image", message: "Where would you like to  add image from?", preferredStyle: UIAlertControllerStyle.actionSheet)
        // choose from photos action button
        let chooseAction = UIAlertAction(title: "Choose from photos", style: UIAlertActionStyle.default) { (action) in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.photoLibrary
            image.allowsEditing = false
            self.present(image, animated: true, completion: nil)
        }
        
        // take photo action button
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.default) { (action) in
            let image = UIImagePickerController()
            image.delegate = self
            image.sourceType = UIImagePickerControllerSourceType.camera
            image.allowsEditing = false
            self.present(image, animated: true, completion: nil)
        }
        
        // cancel action button
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) { (action) in
        }
        
        // add action buttons to action sheet
        myActionSheet.addAction(chooseAction)
        myActionSheet.addAction(takePhotoAction)
        myActionSheet.addAction(cancelAction)
        
        // support iPads (popover view)
        if let popoverController = myActionSheet.popoverPresentationController {
            popoverController.sourceView = sender as? UIView
            popoverController.sourceRect = (sender as AnyObject).bounds
        }
        self.present(myActionSheet, animated: true, completion: nil)
        
    }
    
    
    //This function assigns the selected image to the selectedIMG outlet
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismiss(animated: true, completion: nil)
        self.imageIV.image = image
    }

    @IBAction func submitBTN(_ sender: AnyObject) {
        
        if imageIV.image == nil{
            displayMessage("Please choose an image")
        }
        else{
            let query = PFObject(className: "Transcations")
            query["productName"] = pName
            query["userName"] = uName
            //query["requestedQuantity"] = cRequests
            //success saving, Now save image.
            //create an image data
            let imageData = UIImagePNGRepresentation(self.imageIV!.image!)
            //create a parse file to store in cloud
            let parseImageFile = PFFile(name: "myImage.png", data: imageData!)
            query["billImage"] = parseImageFile
            
            query.saveInBackground(block: { (success, error) -> Void in
                if success {
                    
                    self.displayMessage("Your Bill has been sent successfully")

                } else {
                    print("Something went wrong")
                }
            })
            
            
            let query1 = PFQuery(className:"ClientRequests")
                query1.whereKey("userName", equalTo: AnnouncementViewController.nameOfUser).whereKey("productName", equalTo: self.pName)
                query1.findObjectsInBackground {
                    (objects: [PFObject]?, error: Error?) -> Void in
                    
                    if error == nil {
                        if let objects = objects {
                            for object in objects {
                                //print(object.objectId!)
                                query1.getObjectInBackground(withId: object.objectId!) {
                                    (newObject: PFObject?, error: Error?) -> Void in
                                    if error != nil {
                                        print(error!)
                                    } else {
                                        
                                        newObject?["productStatus"] = 2
                                        newObject?.saveInBackground()
                                    }
                                }
                            }
                        }
                        
                        
                    } else {
                        // Log details of the failure
                        print("Error: \(error!) \(error?.localizedDescription)")
                    }
                }

            
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
