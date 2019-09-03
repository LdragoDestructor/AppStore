//
//  HorizontalMultipleAppsController.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.



import UIKit

class HorizontalMultipleAppsController:HorizontalSnappingController,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    
    var closure:((Results)->())?
    
    var result:FeedResult?{
        didSet{
             self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HorizontalMultipleAppsCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
      
       // collectionView.isPagingEnabled = true
        
    
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let res = self.result?.feed.results[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HorizontalMultipleAppsCell
        cell.appName.text = res?.name
        cell.companyName.text = res?.artistName
        cell.imageName.sd_setImage(with: URL(string: res?.artworkUrl100 ?? ""))
    
        
        
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let app = result?.feed.results[indexPath.item] else {return}
        closure?(app)
        
    
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height:CGFloat = (view.frame.height-60)/3
        return .init(width: view.frame.width - 40, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 10, left: 5, bottom: 0, right: 17)
    }
    
    
    

    
}



