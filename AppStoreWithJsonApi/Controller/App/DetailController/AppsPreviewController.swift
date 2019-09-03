//
//  AppsPreviewController.swift
//  AppStore
//
//  Created by Fuad Hasan on 7/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class ImageCell:UICollectionViewCell{
    
        let image = UIImageView(cornerRadius: 8)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //image.backgroundColor = .purple
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        addSubview(image)
        image.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class AppsPreviewController:HorizontalSnappingController,UICollectionViewDelegateFlowLayout{
    
    let cellId = "cellId"
    var screenShot = [String]()
    
    var res:Result?{
        
        didSet{
            print(res?.trackName ?? "")
            self.screenShot = res?.screenshotUrls ?? []
            self.collectionView.reloadData()
        }
    }
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
      
        return self.screenShot.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCell
        cell.image.sd_setImage(with: URL(string: self.screenShot[indexPath.item]))
        //cell.backgroundColor = .blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
    
}
