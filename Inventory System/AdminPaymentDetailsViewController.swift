//
//  AdminPaymentDetailsViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 3/30/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class AdminPaymentDetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var pName:String = String()
    var uName:String = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imageIV: UIImageView!


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func uploadBTN(_ sender: Any) {
        
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
    
    @IBAction func sendReceiptBTN(_ sender: Any) {
        
        if imageIV.image != nil{
            
            //create an image data
            let imageData = UIImagePNGRepresentation(self.imageIV!.image!)
            //create a parse file to store in cloud
            let parseImageFile = PFFile(name: "myImage.png", data: imageData!)
            
            let query = PFQuery(className:"ClientRequests")
            query.whereKey("userName", equalTo: self.uName).whereKey("productName", equalTo: self.pName)
            query.findObjectsInBackground {
                (objects: [PFObject]?, error: Error?) -> Void in
                
                if error == nil {
                    if let objects = objects {
                        for object in objects {
                            //print(object.objectId!)
                            query.getObjectInBackground(withId: object.objectId!) {
                                (newObject: PFObject?, error: Error?) -> Void in
                                if error != nil {
                                    print(error!)
                                } else {
                                    newObject?["productStatus"] = 3
                                    newObject?["paymentReceipt"] = parseImageFile
                                    newObject?.saveInBackground()
                                    
                                    self.displayAlertWithTitle("Success!",
                                                              message:"Receipt is sent to the Client.")
                                }
                                }
                            }
                        }
                    }
                }
            }

    }
    

    
//    @IBAction func addCard(_ sender: Any) {
//        
//        cardNumTF.text = ""
//        expiryDateTF.text = ""
//        cvvTF.text = ""
//    }
   
    func displayMyAlertMessage(_ userMessage:String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }

    func displayAlertWithTitle(_ title:String, message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction:UIAlertAction =  UIAlertAction(title: "OK", style: .default) {(_) -> Void in
            self.dismiss(animated: true, completion: nil)}
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }

    func displayMessage(_ message:String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title:"OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert,animated:true, completion:nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
