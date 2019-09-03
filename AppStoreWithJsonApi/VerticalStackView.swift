//
//  VerticalStackView.swift
//  AppStore
//
//  Created by Fuad Hasan on 4/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class VerticalStackView:UIStackView {
    init(views:[UIView],spacing:CGFloat=0){
       super.init(frame: .zero)
        views.forEach { (view) in
          addArrangedSubview(view)
        }
       self.axis = .vertical
       self.spacing = spacing
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
