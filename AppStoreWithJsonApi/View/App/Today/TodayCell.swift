//
//  TodayCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 9/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class TodayCell:BaseTodayCell{
    
    let title = UILabel(text: "ABC", font: .boldSystemFont(ofSize: 20))
    let descript = UILabel(text: "CDF", font: .boldSystemFont(ofSize: 24))
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    let details = UILabel(text: "aspaps asas asas", font: .systemFont(ofSize: 14))
    
    var topConstraint:NSLayoutConstraint?
        
    
    override var result:TodayModel!{
        didSet{
            title.text = result.title
            descript.text = result.description
            imageView.image = result.image
            details.text = result.details
            //backgroundColor = result.backGroundColor
            backgroundView?.backgroundColor = result.backGroundColor
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = .white
        layer.cornerRadius = 13
        let container = UIView()
        container.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 250, height: 250))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //clipsToBounds = true
        
        let stackView = VerticalStackView(views: [title,descript,container,details], spacing: 4)
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint?.isActive = true
        
        //clipsToBounds = true
    }
    
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
