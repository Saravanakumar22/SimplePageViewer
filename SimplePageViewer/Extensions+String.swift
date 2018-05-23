//
//  Extensions+String.swift
//  Recipes
//
//  Created by Saravanakumar Murugesan on 04/08/17.
//  Copyright © 2017 ZydeSoft. All rights reserved.
//

import UIKit
import Foundation


extension String {
    
    func sizeWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGSize
    {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: font], context: nil)
        
        return CGSize(width: ceil(boundingBox.width), height: ceil(boundingBox.height))
    }
    
}
