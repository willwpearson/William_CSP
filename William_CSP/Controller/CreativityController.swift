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
    
    var largePhotoIndexPath: IndexPath?
    {
        didSet
        {
            var indexPaths = [IndexPath]()
            if let largePhotoIndexPath = largePhotoIndexPath
            {
                indexPaths.append(largePhotoIndexPath)
            }
            if let oldValue = oldValue
            {
                indexPaths.append(oldValue)
            }
            
            collectionView?.performBatchUpdates(
                {
                self.collectionView?.reloadItems(at: indexPaths)
                })
            {
                completed in
                
                if let largePhotoIndexPath = self.largePhotoIndexPath
                {
                    self.collectionView?.scrollToItem(at: largePhotoIndexPath,
                                                      at: .centeredVertically,
                                                      animated: true)
                }
            }
        }
    }
    
    //MARK: Lifecycle methods
    override public func  viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK:- UICollectionView methods
    
    override public func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        numberOfItemsInSection section: Int) -> Int
    {
        return artSelection.count
    }
    
    override public func collectionView(_ collectionView: UICollectionView,
                                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .cyan
        artCell.imageView.image = artSelection[indexPath.row]
        artCell.imageName.text = "My Art"
        
        return artCell
    }
}
