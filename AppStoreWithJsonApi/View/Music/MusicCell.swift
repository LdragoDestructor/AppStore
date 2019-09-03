//
//  MusicCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 14/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class MusicCell:UICollectionViewCell{
    
    let imageView = UIImageView(cornerRadius: 15)
    let title = UILabel(text: "Title Name", font: .boldSystemFont(ofSize: 20))
    let details = UILabel(text: "Taylor Swift  *reputation *pop",numberofLine: 2, font: .systemFont(ofSize: 14))
    let seperator :UIView = {
        let sep = UIView()
        sep.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return sep
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        imageView.backgroundColor = .blue
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.clipsToBounds = true
        imageView.constrainWidth(constant: 60)
        imageView.constrainHeight(constant: 60)
        
        let stackview = UIStackView(addArrangedSubviews: [imageView,VerticalStackView(views: [title,details], spacing: 5)], spacing: 8)
        
        stackview.alignment = .center
        addSubview(stackview)
        stackview.fillSuperview(padding: .init(top: 7, left: 12, bottom: 7, right: 12))
        
        addSubview(seperator)
        seperator.anchor(top:  imageView.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 12, left: 0, bottom: 0, right: 0),size: .init(width: 0, height: 0.5))
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
