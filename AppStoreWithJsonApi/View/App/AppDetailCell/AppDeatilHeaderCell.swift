//
//  AppDeatilHeaderCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 7/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppDeatilsHeaderCell:UICollectionViewCell{
    
    
    var result:Result?{
        didSet{
            appName.text = result?.trackName
            //cell?.newslabel.text = self.app.first?.releaseNotes ?? ""
           releaseNotes.text = result?.releaseNotes
            imageIcon.sd_setImage(with: URL(string: result?.artworkUrl60 ?? ""))
            getButton.setTitle(result?.formattedPrice, for: .normal)
            // cell?.backgroundColor = .red
        }
    }
    
    
    
    let appName = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 25))
    let imageIcon = UIImageView(cornerRadius: 12)
    let newslabel = UILabel(text: "What News", font:.boldSystemFont(ofSize: 20))
    let releaseNotes = UILabel(text: "release Notes", font: .systemFont(ofSize: 16))
    let getButton = UIButton(title: "FREE", cornerRadius: 13)
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //backgroundColor = .red
        imageIcon.clipsToBounds = true
        imageIcon.contentMode = .scaleAspectFill
        imageIcon.backgroundColor = .green
        imageIcon.constrainWidth(constant: 90)
        imageIcon.constrainHeight(constant: 90)
        imageIcon.layer.borderWidth = 0.2
        //getButton.backgroundColor = .white
        getButton.backgroundColor = .blue
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        getButton.setTitleColor(.white, for: .normal)
        getButton.constrainWidth(constant: 80)
        
      
        
        
        let stackView = VerticalStackView(views: [UIStackView(addArrangedSubviews: [imageIcon,VerticalStackView(views: [appName,UIStackView(addArrangedSubviews: [getButton,UIView()]),UIView()],spacing: 2)]
            , spacing: 12),newslabel,releaseNotes]
            , spacing: 12)
        
        
       addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 0, right: 12))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UIStackView{
    convenience init(addArrangedSubviews:[UIView],spacing:CGFloat = 0){
        
        self.init(arrangedSubviews: addArrangedSubviews)
        self.spacing = spacing
    }
}
