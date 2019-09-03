//
//  ReviewModel.swift
//  AppStore
//
//  Created by Fuad Hasan on 8/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import Foundation

struct  ReviewModel:Decodable {
    let feed:FeedReview
}
struct FeedReview:Decodable{
    let entry:[Entry]
    
}
struct Entry:Decodable{
    let author:Author
    let title:Label
    let content:Label
    let rating:Label
    
    
    private enum CodingKeys: String, CodingKey {
        case author, title,content
        case rating = "im:rating"
    }
}



struct Author:Decodable{
    let name:Label
}
struct Label:Decodable {
    let label:String
}

