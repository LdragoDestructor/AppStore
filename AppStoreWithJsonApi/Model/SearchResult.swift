//
//  SearchResult.swift
//  AppStore
//
//  Created by Fuad Hasan on 4/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import Foundation


struct SearchResult:Decodable{
    let resultCount:Int
    let results:[Result]
}
struct Result:Decodable {
    
    let artistName:String?
    let collectionName:String?
    let trackId:Int
    let releaseNotes:String?
    let description:String?
    let formattedPrice:String?
    let trackName:String
    let primaryGenreName:String
    let averageUserRating:Float?
    let screenshotUrls:[String]?
    let artworkUrl60:String?
}
