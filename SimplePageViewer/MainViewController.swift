//
//  ViewController.swift
//  SimplePageViewer
//
//  Created by Saravanakumar on 23/05/18.
//  Copyright © 2018 Saravanakumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,SegmentControlViewDelegate,UIScrollViewDelegate {

    @IBOutlet var collectionView:UICollectionView!
    @IBOutlet var SGView:SegmentControlView!
    
    let colors = [UIColor.red,UIColor.blue,UIColor.yellow,UIColor.orange,UIColor.purple,UIColor.brown,UIColor.cyan,UIColor.black,UIColor.green]
    
    let nameList = ["Red","Blue","Yellow","Orange","Purple","Brown","Cyan","Black","Green"]

    override func viewDidLoad() {
        super.viewDidLoad()

        SGView.height.constant = 50.0
        SGView.arrayLists = nameList
        SGView.collectionView.reloadData()
        SGView.delegate = self
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        collectionView.register(UINib(nibName: "MainCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MainCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        cell.backgroundColor = colors[indexPath.item]
        cell.setTitle(string: nameList[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    
    func didSelectControl(_ item: Int) {
        collectionView.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        if scrollView == collectionView {
            for cell in collectionView.visibleCells {
                let indexPath = collectionView.indexPath(for: cell)
                
                SGView.selectedItem = indexPath!.item+1
                SGView.reloadCollectionView()
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

