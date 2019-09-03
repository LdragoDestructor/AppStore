//
//  TodayModel.swift
//  AppStore
//
//  Created by Fuad Hasan on 9/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import Foundation
import UIKit

struct TodayModel{
    
    let title:String
    let description:String
    let image:UIImage?
    let details:String
    let backGroundColor:UIColor
    let celltype:CellType
    let feedResult:[Results]
    //let feedResult:Feed?
    
    
    enum CellType:String{
        case single,multiple
    }
}
