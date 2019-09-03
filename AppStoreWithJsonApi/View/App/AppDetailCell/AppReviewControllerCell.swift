//
//  AppReviewControllerCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 8/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppReviewControllerCell:UICollectionViewCell{
    
    let title = UILabel(text: "Reviews title",numberofLine: 1, font: .boldSystemFont(ofSize: 20))
    //let star = UILabel(text: "star", font: .systemFont(ofSize: 16))
    
    let review = UILabel(text: "review", font: .systemFont(ofSize: 15))
    let author = UILabel(text: "Author",numberofLine: 1, font: .systemFont(ofSize: 15))
   
    
    let star:UIStackView = {
        
        var image = [UIView]()
        (0..<5).forEach{_ in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant:24)
            image.append(imageView)
        }
        image.append(UIView())
       let stackView = UIStackView(addArrangedSubviews:image)
        return stackView
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 15
        clipsToBounds = true
        backgroundColor = UIColor(white: 0.90, alpha: 0.5)
        author.textAlignment = .right
        
        
        let stackView = VerticalStackView(views: [UIStackView(addArrangedSubviews: [title,author], spacing: 3),star,review,UIView()], spacing: 1)
        addSubview(stackView)
        title.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        //title.layoutIfNeeded()
        
        stackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 12, right: 5))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
