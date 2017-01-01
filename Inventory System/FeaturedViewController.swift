//
//  FeaturedViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var announcementsTV: UITableView!
    
    var detailedDescription:String = String()
    
    var numProducts:Int = Int()
    
    var products:[Announcements] = []
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ParseOperaions.retrieveProducts()
        products = ParseOperaions.allProducts
        announcementsTV.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    let ANNOUNCEMENT_TAG = 70
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell",for: indexPath)
        //let imageLBL = cell.viewWithTag(71) as! UIImageView!
        let announcementLBL:UILabel = cell.viewWithTag(70) as! UILabel
        announcementLBL.text = products[indexPath.row].name
        return cell
        
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "announcementId"{
            let announcementObjectVC = segue.destination as! AnnouncementViewController
            //announcementObjectVC.numberOfProducts = numProducts
            announcementObjectVC.numberOfProducts = products[(announcementsTV.indexPathForSelectedRow?.row)!].quantity
            announcementObjectVC.aboutProduct = products[(announcementsTV.indexPathForSelectedRow?.row)!].productDescription
            announcementObjectVC.navigationItem.title = products[(announcementsTV.indexPathForSelectedRow?.row)!].name
            announcementObjectVC.nameOfProduct = products[(announcementsTV.indexPathForSelectedRow?.row)!].name
        }
        
        
    }
    
    @IBAction func unwindBack(_ sender:UIStoryboardSegue){
    }
    
    
}
