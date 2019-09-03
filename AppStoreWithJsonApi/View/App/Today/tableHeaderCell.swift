//
//  tableHeaderCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 9/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class tableHeaderCell:UITableViewCell{
    
    var topContraint:CGFloat?
    let header = TodayCell()
    
    
   
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: nil)
    
        addSubview(header)
        header.clipsToBounds = true
        header.fillSuperview()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
