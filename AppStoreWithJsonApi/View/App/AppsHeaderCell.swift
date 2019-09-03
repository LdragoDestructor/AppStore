//
//  AppsHeaderCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppsHeaderCell:UICollectionReusableView{
    
    
    let controller = AppsHeaderCellController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(controller.view)
        controller.view.fillSuperview()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
