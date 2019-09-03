//
//  TodayMulCell.swift
//  AppStore
//
//  Created by Fuad Hasan on 10/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class TodayMulCell:BaseTodayCell{
    
    
   override var result:TodayModel!{
        didSet{
        title.text = result.title
        details.text = result.description
        controller.result = result.feedResult
        //controller.collectionView.reloadData()
        }
    }
    
    let title = UILabel(text: "Well Done" ,font: .systemFont(ofSize: 15))
    let details = UILabel(text: "Good Teammate",numberofLine: 2, font: .boldSystemFont(ofSize: 30))
    
    let controller = TodayMulController(type: .smallScreen)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        backgroundColor = .white
        title.tintColor = UIColor(white: 0.75, alpha: 0.5)
        //controller.view.backgroundColor = .white
        layer.cornerRadius = 12
        
        let stackView = VerticalStackView(views: [title,details,controller.view], spacing: 12)
        addSubview(stackView)
        
        stackView.fillSuperview(padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
