//
//  AppsViewCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppsViewCell:UICollectionViewCell{
    
    let appName = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 25))
    let horizontalAppsController =   HorizontalMultipleAppsController()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appName)
        appName.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        horizontalAppsController.view.backgroundColor = .red
        addSubview(horizontalAppsController.view)
        
        horizontalAppsController.view.anchor(top: appName.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
