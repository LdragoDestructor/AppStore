//
//  Music.swift
//  AppStore
//
//  Created by Fuad Hasan on 14/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

import SDWebImage

class MusicController:BaseTabBarController,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    let footerId = "footerId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(MusicCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(MusicFooterCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        collectionView.backgroundColor = .white
        
        
        fecthUser()
    }
    
    var result = [Result]()
    fileprivate func fecthUser(){
        
        let urlString = "https://itunes.apple.com/search?term=a&offset=25&limit=25"
        
        Internet.shared.fetchAppThroughGen(urlstring: urlString) { (result:SearchResult?, error) in
            self.result = result?.results ?? []
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
        
    }
     var isPaggination = false
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MusicCell
        cell.imageView.sd_setImage(with: URL(string: self.result[indexPath.item].artworkUrl60 ?? ""))
        cell.title.text = self.result[indexPath.item].trackName
        cell.details.text = "\(self.result[indexPath.item].artistName ?? "") * \(self.result[indexPath.item].collectionName ?? "")"
        
        //paginate initiation
        
        if(indexPath.item == result.count  - 1 && !isPaggination ){
            self.isPaggination = true
            
            let urlString = "https://itunes.apple.com/search?term=a&offset=\(result.count )&limit=20"
            
            Internet.shared.fetchAppThroughGen(urlstring: urlString) { (result:SearchResult?, error) in
                
                sleep(2)
                self.result += result?.results ?? []
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.isPaggination = false
            }
        }
        
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 90)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
