//
//  AppDeatilController.swift
//  AppStore
//
//  Created by Fuad Hasan on 7/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppDetailController:BaseTabBarController,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let preViewId = "preViewId"
    let reviewId = "reviewId"
    
    var app = [Result]()
    
    var review:ReviewModel?
    
    var appKey:String
    
    init(appk:String){
        self.appKey = appk
         super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func fetchReviewAndHeader(){
        
        Internet.shared.fetchAppThroughGen(urlstring: "https://itunes.apple.com/lookup?id=\(appKey)") { (result:SearchResult?, err) in
            guard let res = result else {return}
            self.app = res.results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }
        
        Internet.shared.fetchAppThroughGen(urlstring: "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appKey)/sortby=mostrecent/json?l=en&cc=us") {(result:ReviewModel?, error) in
            guard let review =  result else{return}
            self.review = review
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
        
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppDeatilsHeaderCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppPreviewScreenShotCell.self, forCellWithReuseIdentifier: preViewId)
        collectionView.register(AppReviewCell.self, forCellWithReuseIdentifier: reviewId)
        fetchReviewAndHeader()
    }
    fileprivate func fetchReview(){
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? AppDeatilsHeaderCell
            
            
         let res = self.app.first
          cell?.result = res
          return cell ?? UICollectionViewCell()
            
        }
        else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: preViewId, for: indexPath) as! AppPreviewScreenShotCell
            cell.viewController.res = self.app.first
            cell.viewController.collectionView.reloadData()
            return cell
        }
        
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewId, for: indexPath) as! AppReviewCell
            cell.viewController.result = self.review
            return cell
        }
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.item == 0 {
        let dummyCell = AppDeatilsHeaderCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 10))
        
        let res = self.app.first
        dummyCell.result = res
        dummyCell.layoutIfNeeded()
        
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 10))
        
        return .init(width: view.frame.width, height: estimatedSize.height)
        }
        else if indexPath.item == 1{
            return .init(width: view.frame.width, height: 500)
        }
        else {
            return .init(width: view.frame.width, height: 250)
        }
        
    }
     
    
}
