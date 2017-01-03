//
//  ViewController.swift
//  Inventory System
//
//  Created by Manoj Kumar Kotte on 1/1/17.
//  Copyright © 2017 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class HandleRequestViewController: UIViewController {

    @IBOutlet weak var requestedProductIMG: UIImageView!
    
    @IBOutlet weak var requestedProductName: UILabel!
    
    
    @IBOutlet weak var requestedUserName: UILabel!
    
    
    @IBOutlet weak var requestedQunadityNeeded: UILabel!
    
    var productName = String()
    var userName = String()
    var quandity = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        requestedProductName.text = productName
        requestedUserName.text = userName
        requestedQunadityNeeded.text = String(quandity)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func accpetBTN(_ sender: Any) {
        
    }
    
    @IBAction func declineBTN(_ sender: Any) {
        
    }

}
