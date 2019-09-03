//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class BaseTabBarController:UICollectionViewController{
    
    init(){
      super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
