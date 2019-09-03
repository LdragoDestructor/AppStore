//
//  AppsHeaderControllerCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppsHeaderControllerCell:UICollectionViewCell{
    
    let appName = UILabel(text: "Facebook", font: .systemFont(ofSize: 16))
    let title = UILabel(text: "This Is a Good App.You Should Downlord it",numberofLine: 2 ,font: .boldSystemFont(ofSize: 20))
    
    let imageView = UIImageView(cornerRadius: 5)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //clipsToBounds = true
        imageView.backgroundColor = .red
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        clipsToBounds = true
        
         let stackView = VerticalStackView(views: [appName,title,imageView])
        addSubview(stackView)
        stackView.spacing = 5
        stackView.fillSuperview(padding: .init(top: 5, left: 5, bottom: 10, right: 5))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
