//
//  TodayMulController.swift
//  AppStore
//
//  Created by Fuad Hasan on 10/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class TodayMulController:BaseTabBarController,UICollectionViewDelegateFlowLayout{
    
    var result:[Results]?
    
    
    let cellId = "cellId"
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(TodayMulControllerCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .white
        
        
       
        
        if choose == .fullScreen{
            setupCloseButton()
            //setupLabel()
            navigationController?.isNavigationBarHidden = true
            collectionView.contentInset = .init(top: 0, left: 6, bottom: 10, right: 6)
        }
        if choose == .smallScreen{
        collectionView.isScrollEnabled = false
        }
        else{
            collectionView.isScrollEnabled = true
        }
    }
    
  
    var choose:type?
    init(type:type){
        self.choose = type
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCloseButton(){
        let button:UIButton = {
            let button = UIButton(type: .system)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
            button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
            button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            button.tintColor = .darkGray
            return button
            
        }()
        
        view.addSubview(button)
        button.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 12, left: 0, bottom: 0, right: 17),size:.init(width: 40, height: 60))
    }
    
    
    fileprivate func setupLabel(){
        
        let title = UILabel(text: "Well Done" ,font: .systemFont(ofSize: 15))
        let details = UILabel(text: "Good Jod",numberofLine: 2, font: .boldSystemFont(ofSize: 30))
        
        title.tintColor = UIColor(white: 0.75, alpha: 0.5)
        
        let stackView = VerticalStackView(views: [title,details], spacing: 2)
        stackView.fillSuperview()
        //stackView.anc
    }
    @objc func handleDismiss(){
        
        dismiss(animated: true)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if choose == .fullScreen {
        return result?.count ?? 0
        }
        else {
            return min(4,result?.count ?? 0)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let result = self.result?[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayMulControllerCell
        cell.result = result
        
        
        
        //cell.backgroundColor = .red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if  choose == .smallScreen {
        let height = (view.frame.height - 3*10)/4
        return .init(width: view.frame.width , height: height)
        }
       
           // let height = (view.frame.width)
            
            return  .init(width: view.frame.width - 12, height: 90)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let controller = AppDetailController(appk: self.result?[indexPath.item].id ?? "")
        //controller.collectionView.reloadData()
        navigationController?.pushViewController(controller, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    enum type:String{
        case smallScreen
        case fullScreen
    }
}
