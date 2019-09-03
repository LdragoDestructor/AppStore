//
//  MusicFooterCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 14/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class MusicFooterCell:UICollectionViewCell{
    let label = UILabel(text: "Loading....", font: .systemFont(ofSize: 18))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        let activity = UIActivityIndicatorView(style: .whiteLarge)
        activity.color = .darkGray
        activity.startAnimating()
        label.textAlignment = .center
        //activity.hidesWhenStopped = false
    
       
        let stackView = VerticalStackView(views: [activity,label], spacing: 8)
        
        
        addSubview(stackView)
        stackView.centerInSuperview(size: .init(width: 200, height: 0))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
