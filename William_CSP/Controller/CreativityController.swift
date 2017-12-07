//
//  CreativityController.swift
//  William_CSP
//
//  Created by Pearson, William on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//
// MARK: Shows a bolded pulldown menu comment
import UIKit
// MARK: - Class type should inherit from UICollectionViewController
public class CreativityController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    private let reuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow : CGFloat = 3
    
    private lazy var artSelection : [UIImage?] =
    {
        return [
            UIImage(named: "Code Haiku"),
            UIImage(named: "happy tree drawing"),
            UIImage(named: "water_map"),
            UIImage(named: "JavaCode"),
            UIImage(named: "cute reindeer"),
            UIImage(named: "cute reindeer"),
            UIImage(named: "cute reindeer"),
            UIImage(named: "cute reindeer"),
            UIImage(named: "cute reindeer"),
            UIImage(named: "cute reindeer"),
            UIImage(named: "cute reindeer")
            ]
    }()
    
    
}
