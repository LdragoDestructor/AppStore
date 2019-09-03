//
//  HorizonatlSnappingController.swift
//  AppStore
//
//  Created by Fuad Hasan on 6/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class HorizontalSnappingController:UICollectionViewController{
    
    init(){
        let layout = BetterSnappingBehaviour()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
