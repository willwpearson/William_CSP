//
//  DataAndInfoController.swift
//  William_CSP
//
//  Created by Pearson, William on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import Foundation

public class DataAndInfoController : UITableViewController
{
    lazy var bucketList : [BucketItem] =
    {
            return loadBucketListFromFile()
    }()
    
    private func loadBucketListFromFile() -> [BucketItem]
    {
        var items = [BucketItem]()
        if let filePath = Bundle.main.url(forResource: "bucket", withExtension: "csv")
        {
            do
            {
                let input = try String(contentsOf: filePath)
                let bucketLines = input.components(separatedBy: "\n")
                for line in bucketLines
                {
                    let item = line.components(separatedBy: ",")
                    items.append(BucketItem(contents: item[0],author: item[1]))
                }
            }
            catch
            {
                print("File load error")
            }
        }
        
        return items
    }
    
    override public func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return bucketList.count
    }
    
    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let currentCell = tableView.dequeueReusableCell(withIdentifier: "dataIdentifier", for: indexPath) as! BucketItemCell
        
        currentCell.bucketItem = bucketList[indexPath.row]
        //          currentCell.bucketItemSignature.text = currentCell.bucketItem.itemAuthor
        
        return currentCell
    }
}
