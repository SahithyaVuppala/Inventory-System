//
//  FeaturedViewController.swift
//  Inventory System
//
//  Created by Kotte,Manoj Kumar on 10/13/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        // ??? Yet to decide the number of sections in table
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
        
        // ??????? Yet to decide
    }

    let ANNOUNCEMENT_TAG = 70
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell",for: indexPath)
        //cell.textLabel?.text = "Announcement \(indexPath.row + 1)"
        
        
        let announcementLBL:UILabel = cell.viewWithTag(70) as! UILabel
        announcementLBL.text = "Announcement \(indexPath.row + 1)"
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
    
    @IBAction func unwindBack(_ sender:UIStoryboardSegue){
        sender.source as! AnnouncementViewController
    }
 

}
