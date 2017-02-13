//
//  AdminRecentViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 12/7/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit
import Parse
import Bolts

class AdminRecentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var clientRequestsTV: UITableView!
    
    var clientRequests:[ClientRequests] = []
    var requestsSections:[String] = []
    var requestsDictionary:[String:[String]] = [String:[String]]()
    var requestQuantityDictionary:[String:[Int]] = [String:[Int]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        requestsSections.removeAll()
        ParseOperaions.retrieveRequests()
        clientRequests = ParseOperaions.allRequests
        for clientRequest in clientRequests{
            if let _ = requestsSections.index(of: clientRequest.productName){
                //                print("\(clientRequest.productName) is found")
                requestsDictionary[clientRequest.productName]!.append(clientRequest.userName)
                
                // Storing quandity values in this dictionary
                requestQuantityDictionary[clientRequest.productName]!.append(clientRequest.productQuantity)
            }
            else{
                //                print("\(clientRequest.productName) is not found")
                requestsSections.append(clientRequest.productName)
                //                print(clientRequest.userName)
                //                print(clientRequest.productName)
                requestsDictionary[clientRequest.productName] = [clientRequest.userName]
                
                
                requestQuantityDictionary[clientRequest.productName] = [clientRequest.productQuantity]
            }
            
        }
        clientRequestsTV.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return requestsSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return requestsSections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (requestsDictionary[requestsSections[section]]?.count)!
    }
    
    var userName = String()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientRequestsID", for: indexPath)
        //let productIMG = cell.viewWithTag(11) as! UIImageView
        let userNameLBL = cell.viewWithTag(10) as! UILabel
        let resultArray = requestsDictionary[requestsSections[indexPath.section]]
        userNameLBL.text = resultArray?[indexPath.row]
        userName = userNameLBL.text!
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "requestSegueId"{
            
            let handleRequestVC = segue.destination as! HandleRequestViewController
            handleRequestVC.productName = requestsSections[(clientRequestsTV.indexPathForSelectedRow?.section)!]
            handleRequestVC.userName = (requestsDictionary[requestsSections[(clientRequestsTV.indexPathForSelectedRow?.section)!]]?[(clientRequestsTV.indexPathForSelectedRow?.row)!])!
            handleRequestVC.quantity = (requestQuantityDictionary[requestsSections[(clientRequestsTV.indexPathForSelectedRow?.section)!]]?[(clientRequestsTV.indexPathForSelectedRow?.row)!])!
        }
    }
    
    @IBAction func backToClientRequestVC(segue:UIStoryboardSegue){
        // Do nothing
    }
    
}
