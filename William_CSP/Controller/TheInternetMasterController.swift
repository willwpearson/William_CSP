//
//  TheInternetController.swift
//  William_CSP
//
//  Created by Pearson, William on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit

public class TheInternetMasterController: UITableViewController
{
    private (set) lazy var internetTopics : [String] =
    {
        return [
            "Definitions",
            "CSP",
            "CTEC",
            "Canyons",
            "Twitter",
            "Swift Guide"
        ]
    }()
    
    private lazy var addresses : [String] = []
    
    private var detailViewController : InternetDetailController?
    
    private func setup() -> Void
    {
        addresses = [
            "https://apstudent.collegeboard.org/apcourse/ap-computer-science-principles",
            "http://www.canyonsdistrict.org/",
            "https://ctec.canyonsdistrict.org/",
            "https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/index.html#//apple_ref/doc/uid/TP40014097-CH3-ID0",
            "https://twitter.com/?lang=en"
        ]
        
        if let splitView = splitViewController
        {
            let currentControllers = splitView.viewControllers
            detailViewController = currentControllers[0] as?InternetDetailController
        }
    }
    
    override public func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        // Uncomment the following line to preserve selection between presentation
        self.clearsSelectionOnViewWillAppear = false
    }
    
    // MARK: - Table view data source
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return internetTopics.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let currentText = internetTopics[indexPath.row]
        cell.textLabel!.text = currentText
        
        return cell
    }
    
    //MARK: Handle the internal transfer
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier! == "showDetail"
        {
            if let indexPath = self.tableView.indexPathForSelectedRow
            {
                let urlString = addresses[indexPath.row]
                let pageText : String
                
                if indexPath.row == 0
                {
                    pageText = ""
                }
                else
                {
                    pageText = internetTopics[indexPath.row]
                }
                
                let controller = segue.destination as!InternetDetailController
                
                controller.detailAddress = urlString
                controller.detailText = pageText
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
}
