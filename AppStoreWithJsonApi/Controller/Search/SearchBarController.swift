//
//  SearchBarController.swift
//  AppStore
//
//  Created by Fuad Hasan on 4/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit
import SDWebImage

class SearchBarController: BaseTabBarController,UICollectionViewDelegateFlowLayout,UISearchBarDelegate {
    
    fileprivate let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.addSubview(label)
        label.centerXInSuperview()
        label.anchor(top: collectionView.topAnchor, leading: collectionView.leadingAnchor, bottom: nil, trailing: collectionView.trailingAnchor,padding: .init(top: 50, left: 0, bottom: 0, right: 0))
        //label.fillSuperview(padding: .init(top: 60, left: 90, bottom: 0, right: 15))
        collectionView.register(SearchControllerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white

       
         setSearchController()
         //fetchjson()
    
    }
    fileprivate var result:SearchResult?
    
    fileprivate let label:UILabel={
        let label = UILabel()
        label.text = "Enter apps name for search result"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate func setSearchController(){
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
    }
    var timer:Timer?
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            Internet.shared.fetchUser(searchText:searchText) { (result:SearchResult?,error) in
            
                guard let result = result else{return}
                
                result.results.forEach({ (res) in
                    print(res.trackName)
                })
               
                self.result = result
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        })
        
    }
                
        
    
   
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        label.isHidden = result?.results.count ?? 0>0
        return  result?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchControllerCell
        
        
        
        let app = result?.results[indexPath.item]
        cell.app = app
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = AppDetailController(appk:String(self.result?.results[indexPath.item].trackId ?? 0))
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
  
    
}
