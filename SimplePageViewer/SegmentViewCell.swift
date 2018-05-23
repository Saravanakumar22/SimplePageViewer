//
//  SegmentViewCell.swift
//  Recipes
//
//  Created by Saravanakumar Murugesan on 04/08/17.
//  Copyright © 2017 ZydeSoft. All rights reserved.
//

import UIKit

class SegmentViewCell: UICollectionViewCell {
    
    static let width:CGFloat = UIScreen.main.bounds.width
    static let height:CGFloat = 50.0

    @IBOutlet weak var titleBorderView: GenericBorderView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleWidth: NSLayoutConstraint!
    @IBOutlet weak var titleHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateTitle(_ title:String, selected:Bool){
        
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        let size = title.sizeWithConstrainedWidth(SegmentViewCell.width, font: UIFont.boldSystemFont(ofSize: 16.0))
        
        titleWidth.constant = min(size.width, SegmentViewCell.width)
        
        self.layoutIfNeeded()
        
        if selected{
            
            titleBorderView.borders = UIEdgeInsetsMake(0.0, 0.0, 1.0, 0.0)
        }else{
            
            titleBorderView.borders = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        }
    }
}

