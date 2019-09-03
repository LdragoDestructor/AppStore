//
//  AppResult.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import Foundation


struct FeedResult:Decodable{
    
    let feed:Feed
}
struct Feed:Decodable {
    let title:String
    let results:[Results]
    
}
struct Results: Decodable {
    
    let id:String
    let name:String
    let artistName:String
    let artworkUrl100:String
    
}
