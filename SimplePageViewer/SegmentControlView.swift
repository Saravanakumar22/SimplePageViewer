//
//  SegmentControlView.swift
//  Recipes
//
//  Created by Saravanakumar Murugesan on 04/08/17.
//  Copyright © 2017 ZydeSoft. All rights reserved.
//

import UIKit
import CoreData

@objc protocol SegmentControlViewDelegate{
    
    func didSelectControl(_ item:Int)
}

class SegmentControlView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet var height : NSLayoutConstraint!
    
    var arrayLists : [String]!
    var selectedItem:Int = 1
    weak var delegate:SegmentControlViewDelegate?
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor.lightGray
        collectionView.register(UINib(nibName: "SegmentViewCell", bundle: nil), forCellWithReuseIdentifier: "SegmentViewCellID")
    }
    
    func reloadCollectionView() {
        print("CollectionView reloading...")
        collectionView.reloadData()
        collectionView.scrollToItem(at: IndexPath(item: (selectedItem-1), section: 0), at: .centeredHorizontally, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayLists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (arrayLists[indexPath.row]).sizeWithConstrainedWidth(collectionView.frame.width, font: UIFont.boldSystemFont(ofSize: 16.0))
        
        return CGSize(width: size.width + 20 , height: 50.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentViewCellID", for: indexPath) as! SegmentViewCell
        
        let cat = arrayLists[indexPath.item]
        cell.updateTitle(cat, selected: (selectedItem - 1 == indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if selectedItem != indexPath.row + 1{
            
            collectionView.deselectItem(at: indexPath, animated: false)
            
            delegate!.didSelectControl(indexPath.item)
                
            selectedItem = indexPath.row + 1
            collectionView.reloadData()
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            
        }
    }
}
