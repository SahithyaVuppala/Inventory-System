//
//  HistoryViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/15/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet var historyTV: UITableView!
    var numProducts:Int = Int()
    var allProducts:[ClientRequests] = []
    var userProducts:[ClientRequests] = []

    
    func retrieveUserProducts(userName:String){
        ParseOperaions.retrieveRequests()
        allProducts = ParseOperaions.allRequests
        for userProduct in allProducts{
            if userProduct.userName == userName{
                userProducts.append(userProduct)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userProducts.removeAll()
        retrieveUserProducts(userName: AnnouncementViewController.nameOfUser)
        historyTV.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userProducts.count
//        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "historyAnnouncement",for: indexPath)
        cell.textLabel?.text = userProducts[indexPath.row].productName
        
//        cell.textLabel?.text = "Manoj"
        
        //cell.detailTextLabel?.text = "Pending for approval"
        //let announcementLBL:UILabel = cell.viewWithTag(100) as! UILabel
        //announcementLBL.text = "Announcement \(indexPath.row + 2)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ???? Action should be performed when we click on each row
        
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func backToHistory(_ sender: UIStoryboardSegue){
        sender.source as! BillingViewController
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
