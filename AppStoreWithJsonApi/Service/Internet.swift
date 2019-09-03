//
//  Internet.swift
//  AppStore
//
//  Created by Fuad Hasan on 4/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import Foundation
class Internet {
    
    static let shared = Internet()
    
    
    func fetchUser(searchText:String,completion:@escaping (SearchResult?,Error?)->()) {
        print("Fetching Data .....")
        let urlString = "https://itunes.apple.com/search?term=\(searchText)&entity=software"
        
     fetchAppThroughGen(urlstring: urlString, completion: completion)
    }
    
    
    
    func fetchtopFreeApp(completion:@escaping (FeedResult?,Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/25/explicit.json"
        
        fetchAllApp(urlstring: urlString, completion: completion)
        
    }
    
    
    func fetchGamesApp(completion:@escaping (FeedResult?,Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json"
        
        fetchAllApp(urlstring: urlString, completion: completion)
        
    }
    
    
    func fetchtopPaidApp(completion:@escaping (FeedResult?,Error?)->()){
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-paid/all/25/explicit.json"
        
        fetchAllApp(urlstring: urlString, completion: completion)
        
    }
    func fetchAllApp(urlstring:String,completion:@escaping (FeedResult?,Error?)->()){
        
        
       // guard let urlString = urlstring else {return}
        
   fetchAppThroughGen(urlstring: urlstring, completion: completion)
        
    }
    
    
    func fetchAppHeaderCell(completion:@escaping ([AppHeaderResult]?,Error?)->()){
        
        
        let urlstring = "https://api.letsbuildthatapp.com/appstore/social"
       fetchAppThroughGen(urlstring: urlstring, completion: completion)
    }
    
    
    
    func fetchAppThroughGen<T:Decodable>(urlstring:String,completion:@escaping (T?,Error?)->()){
        
        guard let url = URL(string: urlstring) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err{
                print("Failed to fetch data",err)
                
            }
            guard let data = data else{return}
            
            do{
                let searchResult = try JSONDecoder().decode(T.self, from: data)
                completion(searchResult,nil)
                
            } catch{
                print("Failed to fetch Data",error)
               // completion(,error)
            }
            
            }.resume()
}
    
    
}
