//
//  BaseTodayCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 11/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit


class BaseTodayCell:UICollectionViewCell{
    var result:TodayModel!
    
    
    override var isHighlighted: Bool{
        
        didSet{
            var transform :CGAffineTransform = .identity
            
            if isHighlighted{
                transform = .init(scaleX: 0.9, y: 0.9)
            }
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.transform = transform
            }, completion: nil)
        }
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView = UIView()
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
       // layer.shadowColor = UIColor.red.cgColor
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        self.backgroundView?.layer.shouldRasterize = true
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 12
        //layer.shadowOffset = .init(width: 0, height: 20)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


