//
//  AppReviewCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 7/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppReviewCell:UICollectionViewCell{
    
    
    let review = UILabel(text: "Reviews and Ratings", font: .boldSystemFont(ofSize: 25))
    let viewController = AppReviewController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .red
        
        
        let  stackView = VerticalStackView(views: [review,viewController.view], spacing: 5)
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 0, left: 12, bottom: 5, right: 5))
        //viewController.view.backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
