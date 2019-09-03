//
//  File.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit


class HorizontalMultipleAppsCell:UICollectionViewCell{
    
    
    let imageName = UIImageView(cornerRadius: 7)
    let companyName = UILabel(text: "Company Name", font: .systemFont(ofSize: 14))
    let appName = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let button = UIButton(title: "Get", cornerRadius: 15)
    let seperator :UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
        
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .green
        //imageName.backgroundColor = .red
        imageName.clipsToBounds = true
        imageName.contentMode = .scaleAspectFill
        button.backgroundColor = .white
        imageName.constrainWidth(constant: 70)
        imageName.constrainHeight(constant: 70)
        imageName.layer.borderWidth = 0.2
        seperator.constrainHeight(constant: 0.5)
    
        companyName.textColor = UIColor(white: 0.5, alpha: 0.5)
        button.constrainWidth(constant: 70)
        button.backgroundColor = UIColor(white: 0.90, alpha: 0.5)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        
        
        let verticalStackView = VerticalStackView(views: [appName,companyName], spacing: 5)
        
        let stackView = UIStackView(arrangedSubviews: [imageName,verticalStackView,button])
        stackView.spacing = 10
        stackView.alignment = .center
        addSubview(stackView)
        addSubview(seperator)
         stackView.fillSuperview()
        //seperator.anchor(top: nil, leading: appName.leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: -4, right: 0))
        
        seperator.anchor(top: companyName.bottomAnchor, leading: companyName.leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 16, left: 0, bottom: 0, right: 0))
       
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


