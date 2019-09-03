//
//  Extension.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

extension UILabel{
    convenience init(text:String,numberofLine:Int = 0,font:UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.numberOfLines = numberofLine
        self.font = font
    }
    }
    
    extension UIButton{
        convenience init(title:String,cornerRadius:CGFloat) {
            self.init(type:.system)
            self.layer.cornerRadius = cornerRadius
            self.setTitle(title,for:.normal)
        }
    }

extension UIImageView{
    convenience init(cornerRadius:CGFloat) {
        self.init(image:nil)
        self.layer.cornerRadius = cornerRadius
        
    }
}
    

