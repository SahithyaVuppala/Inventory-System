//
//  AdminAnnouncementsViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 12/7/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class AdminAnnouncementsViewController: UIViewController {

    @IBOutlet weak var adminAnnouncementsTV: UITableView!
    
    
    var products:[Announcements] = []
    
    override func viewDidLoad() {
        
        // This statement is not loading for the first time , thats why i have added the same statement in appdelegate. We have to fix this asap!.
        
        ParseOperaions.retrieveProducts()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        ParseOperaions.retrieveProducts()
        products = ParseOperaions.allProducts
        adminAnnouncementsTV.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "adminAnnouncement",for: indexPath)
        let productIMG = cell.viewWithTag(20) as! UIImageView
        let productNameLBL = cell.viewWithTag(21) as! UILabel
        productNameLBL.text = products[indexPath.row].name
        //productIMG.image = products[indexPath.row] as! UIImage
        productIMG.image = ParseOperaions.allImages[indexPath.row]
        return cell
    }
    
    
      //MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
      func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
 
    
    
    @IBAction func unwindToCancel(_ sender:UIStoryboardSegue){
        
    }


}
