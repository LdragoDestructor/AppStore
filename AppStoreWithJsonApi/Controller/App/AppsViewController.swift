//
//  AppsViewController.swift
//  AppStore
//
//  Created by Fuad Hasan on 5/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class AppsViewController:BaseTabBarController,UICollectionViewDelegateFlowLayout{
    let cellId = "cellId"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(AppsViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.backgroundColor = .white
        //collectionView.isPagingEnabled = true
        
        fetch_json()
    }
    
    var appGroup = [FeedResult]()
    var headercell = [AppHeaderResult]()

 
    fileprivate func fetch_json(){
        
        var freeApp:FeedResult?
        var gamesApp:FeedResult?
        var paidApp:FeedResult?
        
        
        let dispatchGroup = DispatchGroup()
        
        
        dispatchGroup.enter()
        
        Internet.shared.fetchtopFreeApp { (res,err) in
            dispatchGroup.leave()
            freeApp = res
        }
        
        dispatchGroup.enter()
        Internet.shared.fetchGamesApp{ (res,err) in
            dispatchGroup.leave()
            gamesApp = res
        }
        
        dispatchGroup.enter()
        Internet.shared.fetchtopPaidApp{ (res,err) in
            paidApp = res
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        
        Internet.shared.fetchAppHeaderCell { (res,err) in
            
            dispatchGroup.leave()
            guard let r1 = res else{return}
            self.headercell = r1
            
            }
        
        
        
        dispatchGroup.notify(queue: .main){
            
            if let app = gamesApp{
                self.appGroup.append(app)
            }
            if let app = freeApp{
                self.appGroup.append(app)
            }
          
            if let app = paidApp{
                self.appGroup.append(app)
            }
            
            
            self.collectionView.reloadData()
        }
        
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.appGroup.count
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headcell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeaderCell
        headcell.controller.res = headercell
        headcell.controller.collectionView.reloadData()
        //headcell.backgroundColor = .red
        return headcell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsViewCell
        
        cell.appName.text = appGroup[indexPath.item].feed.title
        cell.horizontalAppsController.result = appGroup[indexPath.item]
        cell.horizontalAppsController.closure = {[weak self] app in
            
            
            let viewController = AppDetailController(appk: app.id)
            self?.navigationController?.pushViewController(viewController, animated: true)
            //viewController.view.backgroundColor = .red
            viewController.navigationItem.title = app.name
           
        }
        
        //cell.backgroundColor = .blue
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 5, left: 35, bottom: 10, right: 10)
    }
    
    
    
}
