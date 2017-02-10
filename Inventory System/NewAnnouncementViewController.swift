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
    
//    let imagePicker = UIImagePickerController()
//    
//    var imageData:NSData! = NSData()
    
    override func viewDidLoad() {
        self.navigationItem.title = "Add Product"
        super.viewDidLoad()
//        imagePicker.delegate = self


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
    }
    
    @IBAction func AddBTN(_ sender: AnyObject) {
        
        if productNameTF.text!.isEmpty || productDescriptionTF.text!.isEmpty || Int(quantityTF.text!) == nil || Int(quantityTF.text!)! <= 0{
            displayMessage("Enter valid details")
        }
        else{
            let announcement = PFObject(className: "Announcements")
            announcement["name"] = productNameTF.text
            announcement["productDescription"] = productDescriptionTF.text
            announcement["quantity"] = Int(quantityTF.text!)!
            //        let imageFile:PFFile = PFFile(data: imageData)!
            //announcement["image"] = ""
            
            //        let imageFile:PFFile = PFFile(data: self.imageData)!
            //        dispatch_async(dispatch_get_main_queue(),{
            //
            //
            //          announcement["image"] = imageFile
            //
            //        })
            //
            //        announcement["image"] = imageFile
            
            
            
            
            announcement.saveInBackground(block: { (success, error) -> Void in
                if success {
                    
                    // I wrote this line because the added item is not showing when it is successfully added, We have to fix this.
                    ParseOperaions.retrieveProducts()
                    
                    self.displayAlertWithTitle("Success!",
                                               message:"Announcement saved.")
                } else {
                    print(error)
                }
            })
        }
        
        
    }
    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            imageIV.contentMode = .ScaleAspectFit
//            imageIV.image = pickedImage
//            
//            imageData = UIImagePNGRepresentation(imageIV.image!)
//        }
//        
////        if let pickedImageURL = info[UIImagePickerControllerMediaURL] as? String{
////            imageTF.text = pickedImageURL
////        }
//        
//        dismissViewControllerAnimated(true, completion: nil)
//    }
//    
//    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        dismissViewControllerAnimated(true, completion: nil)
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
