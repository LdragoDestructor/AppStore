//
//  SearchControllerCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 4/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class SearchControllerCell:UICollectionViewCell{
    
    
    var app:Result?{
        didSet{
            appName.text = app?.trackName
            ratingLabel.text = String(app?.averageUserRating ?? 0.0 )
            titleLabel.text = app?.primaryGenreName
            imageCell.sd_setImage(with: URL(string:app?.artworkUrl60 ?? "" ))
            
            image1.sd_setImage(with: URL(string: app?.screenshotUrls?[0] ?? ""))
            
            if (app?.screenshotUrls?.count ?? 0) > 1 {
                image2.sd_setImage(with: URL(string: app?.screenshotUrls?[1] ?? ""))
            }
            if (app?.screenshotUrls?.count ?? 0) > 2 {
                image3.sd_setImage(with: URL(string: app?.screenshotUrls?[2] ?? "" ))
            }        }
    }
    
    let imageCell:UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 0.3
        image.constrainWidth(constant: 65)
        image.constrainHeight(constant: 65)
        return image
    }()
    
    let appName:UILabel = {
       let name = UILabel()
        name.text = "Twitter"
        return name
    }()
    
    let titleLabel:UILabel = {
       let title = UILabel()
        title.text = "Photo and Editor"
        return title
    }()
    
    let ratingLabel:UILabel = {
        let rating = UILabel()
        rating.text = "Rating :\(5.0)"
        return rating
    }()
    let getButton:UIButton = {
       let button = UIButton()
        button.setTitle("Get", for: .normal)
        button.constrainWidth(constant: 75)
        button.constrainHeight(constant: 25)
        button.layer.cornerRadius = 12
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    lazy var image1 = self.createImageView()
    lazy var image2 = self.createImageView()
    lazy var image3 = self.createImageView()
    
    
    func createImageView()->UIImageView{
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        image.layer.borderWidth = 0.4
        image.clipsToBounds = true
        image.backgroundColor = .red
        return image
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageCell,VerticalStackView(views: [appName,titleLabel,ratingLabel], spacing: 4),
            getButton
            ])
        stackView.spacing = 10
        let imageStackView = UIStackView(arrangedSubviews: [image1,image2,image3])
        imageStackView.distribution
         = .fillEqually
        imageStackView.spacing = 10
        
        let overallStackView = VerticalStackView(views: [stackView,imageStackView], spacing: 8)
        
       
            
        overallStackView.spacing = 10
        addSubview(overallStackView)
        stackView.alignment = .center
        
        overallStackView.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
