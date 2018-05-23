//
//  GenericBorderView.swift
//  Recipes
//
//  Created by Saravanakumar Murugesan on 04/08/17.
//  Copyright © 2017 ZydeSoft. All rights reserved.
//

import UIKit

class GenericBorderView: UIView {

    var borders:UIEdgeInsets = UIEdgeInsets.zero{
        
        didSet{
            
            setNeedsDisplay()
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        let context = UIGraphicsGetCurrentContext();
        context!.setStrokeColor(UIColor.white.cgColor);
        
        context!.setLineWidth(3.0);
        
        if borders.top > 0{
            
            context!.move(to: CGPoint(x: 0.0, y: 0.0))
            context!.addLine(to: CGPoint(x:self.frame.size.width, y: 0.0))
        }
        
        if borders.left > 0{
            context!.move(to: CGPoint(x: 0.0, y: 0.0))
            context!.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        }
        
        if borders.right > 0{
            context!.move(to: CGPoint(x: self.frame.size.width, y: 0.0))
            context!.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        }
        
        if borders.bottom > 0{
            context!.move(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
            context!.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        }
        
        context!.strokePath()
    }

}
