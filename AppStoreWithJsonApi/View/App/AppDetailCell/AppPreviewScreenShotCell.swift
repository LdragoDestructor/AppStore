//
//  AppPreviewScreenShotCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 7/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppPreviewScreenShotCell:UICollectionViewCell{
    
    
    let label = UILabel(text: "Preview", font: .boldSystemFont(ofSize: 30))
    let viewController = AppsPreviewController()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .green
        let stackView = VerticalStackView(views: [label,viewController.view], spacing: 10)
        //viewController.view.backgroundColor = .red
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
