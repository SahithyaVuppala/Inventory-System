//
//  AnnouncementViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class AnnouncementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var numberOfItemsTF: UITextField!

    @IBAction func requestBTN(_ sender: AnyObject) {
        displayMessage("Your Request has been submitted")
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
