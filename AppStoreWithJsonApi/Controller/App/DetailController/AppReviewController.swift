//
//  AppReviewController.swift
//  AppStore
//
//  Created by Fuad Hasan on 8/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppReviewController:HorizontalSnappingController,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    var result:ReviewModel?{
        didSet{
        collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.register(AppReviewControllerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
        
        collectionView.contentInset = .init(top: 0, left: 0, bottom: 0, right: 15)
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.result?.feed.entry.count ?? 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppReviewControllerCell
        let result = self.result?.feed.entry[indexPath.item]
        cell.title.text = result?.title.label
        cell.author.text = result?.author.name.label
        cell.review.text = result?.content.label
      // print(result?[indexPath.item].rating.label)
        
        
        for(index,star) in cell.star.arrangedSubviews.enumerated(){
            
            
            //result?[indexPath.item].rating.label
            if index >= Int(result?.rating.label ?? "") ?? 0{
                star.alpha = 0
            }else{
                star.alpha = 1
            }
        }

        
        
        return cell
    }
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 30, height: view.frame.height - 15)
    }
    
   
    

}
