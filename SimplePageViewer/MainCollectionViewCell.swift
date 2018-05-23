//
//  MainCollectionViewCell.swift
//  SimplePageViewer
//
//  Created by Saravanakumar on 23/05/18.
//  Copyright © 2018 Saravanakumar. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    @IBOutlet var titleLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    
    func setTitle(string:String) {
        
        titleLabel.text = string
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20.0)
    }
}
