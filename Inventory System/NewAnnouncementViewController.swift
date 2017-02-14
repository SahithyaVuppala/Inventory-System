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

class NewAnnouncementViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var productNameTF: UITextField!
    
    @IBOutlet weak var productDescriptionTF: UITextField!

    @IBOutlet weak var quantityTF: UITextField!
    
    
    @IBOutlet weak var imageIV: UIImageView!
    
    //let imagePicker = UIImagePickerController()
    
    var imageDatas: NSData! = NSData()
    
    override func viewDidLoad() {
        self.navigationItem.title = "Add Product"
        super.viewDidLoad()
        //imagePicker.delegate = self


        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func browseBTN(_ sender: AnyObject) {
//        
//        imagePicker.allowsEditing = false
//        imagePicker.sourceType = .PhotoLibrary
//        presentViewController(imagePicker, animated: true, completion: nil)
        
        
        
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
            popoverController.sourceRect = sender.bounds
        }
        self.present(myActionSheet, animated: true, completion: nil)

        
        
    }
    
    
    //This function assigns the selected image to the selectedIMG outlet
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.dismiss(animated: true, completion: nil)
        self.imageIV.image = image
    }
    
    
    @IBAction func AddBTN(_ sender: AnyObject) {
        
        if productNameTF.text!.isEmpty || productDescriptionTF.text!.isEmpty || Int(quantityTF.text!) == nil || Int(quantityTF.text!)! <= 0{
            displayMessage("Enter valid details")
        }
        else{
            if imageIV.image != nil{
                let announcement = PFObject(className: "Announcements")
                announcement["name"] = productNameTF.text
                announcement["productDescription"] = productDescriptionTF.text
                announcement["quantity"] = Int(quantityTF.text!)!
                
                
                //success saving, Now save image.
                //create an image data
                let imageData = UIImagePNGRepresentation(self.imageIV!.image!)
                //create a parse file to store in cloud
                let parseImageFile = PFFile(name: "myImage.png", data: imageData!)
                announcement["image"] = parseImageFile
                
                
                announcement.saveInBackground(block: { (success, error) -> Void in
                    if success {
                        
                        // I wrote this line because the added item is not showing when it is successfully added, We have to fix this.
                        
                        ParseOperaions.retrieveProducts()
                        
                        self.displayAlertWithTitle("Success!",
                                                   message:"Announcement saved.")
                    } else {
                        print("Something went wrong")
                    }
                })
            }
            else{
                displayMessage("Please upload an image")
            }
        }
        
        
    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        // The info dictionary contains multiple representations of the image, and this uses the original.
//        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        
//        // Set photoImageView to display the selected image.
//        imageIV.image = selectedImage
//        
//        // Dismiss the picker.
//        dismiss(animated: true, completion: nil)
//    }
//
//    
//    func prepareImageForSaving(image:UIImage) {
//        // create NSData from UIImage
//        guard let imageData = UIImageJPEGRepresentation(image, 1) else {
//            // handle failed conversion
//            print("jpg error")
//            return
//        }
//        
//        self.saveImage(imageData: imageData as NSData)
//    }
//    
//    func saveImage(imageData: NSData) {
//        imageDatas = imageData
//    }
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
