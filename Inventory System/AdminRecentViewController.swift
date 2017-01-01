//
//  AdminRecentViewController.swift
//  Inventory System
//
//  Created by Thakkellapati,Meghana on 12/7/16.
//  Copyright © 2016 Kotte,Manoj Kumar. All rights reserved.
//

import UIKit

class AdminRecentViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var clientRequestsTV: UITableView!
    
    var clientRequests:[ClientRequests] = []
    var requestsSections:[String] = []
    var requestsDictionary:[String:[String]] = [String:[String]]()
    
    
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
            }
            else{
//                print("\(clientRequest.productName) is not found")
                requestsSections.append(clientRequest.productName)
//                print(clientRequest.userName)
//                print(clientRequest.productName)
                requestsDictionary[clientRequest.productName] = [clientRequest.userName]
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clientRequestsID", for: indexPath)
        //let productIMG = cell.viewWithTag(11) as! UIImageView
        let userNameLBL = cell.viewWithTag(10) as! UILabel
        let resultArray = requestsDictionary[requestsSections[indexPath.section]]
        userNameLBL.text = resultArray?[indexPath.row]
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

}
