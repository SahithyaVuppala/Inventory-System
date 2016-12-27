//
//  AdminAnnouncementsViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 12/7/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class AdminAnnouncementsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    var i = 0
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "adminAnnouncement",for: indexPath)
        cell.textLabel?.text = "Announcement \(i+1)"
        i += 2
        //cell.detailTextLabel?.text = "Pending for approval"
        //let announcementLBL:UILabel = cell.viewWithTag(100) as! UILabel
        //announcementLBL.text = "Announcement \(indexPath.row + 2)"
        return cell
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    @IBAction func unwindToCancel(_ sender:UIStoryboardSegue){
        
    }


}
