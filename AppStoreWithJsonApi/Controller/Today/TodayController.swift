//
//  TodayController.swift
//  AppStore
//
//  Created by Fuad Hasan on 9/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class TodayController:BaseTabBarController,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate{
    
    let cellId = "cellId"
    let mulCell = "mulCell"
    
    
    var item = [TodayModel]()
    
    
    var freeApp:FeedResult?
    var paidApp:FeedResult?
    
    
    let activityIndicator :UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .whiteLarge)
        view.tintColor = .white
        view.startAnimating()
        view.hidesWhenStopped = true
        return view
    }()
    
   
    let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(white: 0.85, alpha: 0.5)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayModel.CellType.single.rawValue)
        collectionView.register(TodayMulCell.self, forCellWithReuseIdentifier: TodayModel.CellType.multiple.rawValue)
        collectionView.contentInset = .init(top: 10, left: 12, bottom: 10, right: 10)
        view.addSubview(activityIndicator)
        activityIndicator.centerInSuperview()
        view.addSubview(blurEffect)
        blurEffect.fillSuperview()
        blurEffect.alpha = 0
        
        fetchApp()
        
        
        
    }
    
    fileprivate func fetchApp(){
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Internet.shared.fetchtopFreeApp { (result:FeedResult?, error) in
            dispatchGroup.leave()
            self.freeApp = result
            if let error = error{
                print("Failed to fetch data",error)
            }
        }
        dispatchGroup.enter()
        
        Internet.shared.fetchtopPaidApp { (result:FeedResult?, error) in
            dispatchGroup.leave()
            self.paidApp = result
            if let error = error{
                print("Failed to fetch error",error)
            }
        }
        
        
        dispatchGroup.notify(queue: .main) {
            
            self.activityIndicator.stopAnimating()
            

            
            self.item = [
                
                
                TodayModel.init(title: "LIFE HACK", description: "Utilizing your Time", image: #imageLiteral(resourceName: "holiday"), details:"All the tools and apps you need to intelligently organize your life the right way.",backGroundColor: #colorLiteral(red: 0.9847045541, green: 0.9580337405, blue: 0.7277022004, alpha: 1),celltype: .single,feedResult: []),
                
                TodayModel.init(title: "HOLIDAY", description: "Travel on a Budget", image: #imageLiteral(resourceName: "garden") , details: "Find out all u need to know how to travel withour packing everything",backGroundColor: .white,celltype: .single ,feedResult: []),
                TodayModel.init(title: "THE DAILY LIST", description: self.freeApp?.feed.title ?? "", image: #imageLiteral(resourceName: "garden"), details: "", backGroundColor: .white,celltype:.multiple,feedResult: self.freeApp?.feed.results ?? []),
                
                
                    TodayModel.init(title: "THE DAILY LIST", description: self.paidApp?.feed.title ?? "", image: #imageLiteral(resourceName: "garden"), details: "", backGroundColor: .white,celltype:.multiple,feedResult: self.paidApp?.feed.results ?? []),
            ]
            
            self.collectionView.reloadData()

        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let celltype = item[indexPath.item].celltype.rawValue
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: celltype, for: indexPath) as! BaseTodayCell
        let result = item[indexPath.item]
        cell.result = result
        
         (cell as? TodayMulCell)?.controller.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handle)))
        return cell
    }
    
    
    var heightAnchor:NSLayoutConstraint?
    var widthAnchor:NSLayoutConstraint?
    var topAnchor:NSLayoutConstraint?
    var leadingAnchor:NSLayoutConstraint?
    var viewController:TableViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.superview?.setNeedsLayout()
    }

    
    
    
    @objc func handle(gesture:UITapGestureRecognizer){
        let collectionView = gesture.view
        
        // figure out which cell were clicking into
        
        var superview = collectionView?.superview
        
        while superview != nil {
            if let cell = superview as? TodayMulCell {
                guard let indexPath = self.collectionView.indexPath(for: cell) else { return }
                
                let apps = self.item[indexPath.item].feedResult
                
                let fullController =  TodayMulController(type: .fullScreen)
                //let fullcontroller = BackEnabledNavigationController(rootViewController: fullController)
                fullController.result = apps
                present(BackEnabledNavigationController(rootViewController: fullController), animated: true)
                return
            }
            
            superview = superview?.superview
        }
      
        
        
    }
    
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    var appFullscreenBeginOffset:CGFloat = 0
    
    @objc func handleGesture(gesture:UIPanGestureRecognizer){
        
        
        let transitionY = gesture.translation(in: self.viewController.view).y
        
        
        if viewController.tableView.contentOffset.y>0{
            return
        }
        
        if gesture.state == .changed {
            self.blurEffect.alpha = 1
            var scale = 1 - transitionY/1000
            if transitionY > 0 {
                scale = max(0.5,scale)
                scale = min(1,scale)
                gesture.view?.transform = .init(scaleX:scale, y: scale)
            }
        }
        
        if gesture.state == .ended {
            if transitionY>0 {
            self.handledismiss()
            }
        }
        


      
        
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        
        let cell = collectionView.cellForItem(at: indexPath)
        
       
        
      // if item[indexPath.item].celltype == .multiple{
        if let _ = cell as? TodayMulCell{
            let presentController = TodayMulController(type: .fullScreen)
            let controller = BackEnabledNavigationController(rootViewController: presentController)
            presentController.result = item[indexPath.item].feedResult
            presentController.collectionView.reloadData()
            presentController.view.backgroundColor = .white
            present(controller, animated: true, completion: nil)
            return
        }

        let viewController = TableViewController()                //viewController.view = view
        let childView = viewController.view!
        childView.backgroundColor = .white
       // let gesture = UITapGestureRecognizer(target: self, action: #selector(handledismiss))
        //childView.addGestureRecognizer(gesture)
        viewController.result = item[indexPath.item]
        self.navigationController?.navigationBar.isHidden = true
        
        
        
        
        
        //let cell = collectionView.cellForItem(at: indexPath)
        guard let absoluteCoordinator = cell?.superview?.convert(cell!.frame, to: nil) else{return}
        //self.startingFrame = absoluteCoordinator
        self.startingFrame = absoluteCoordinator
    

        guard let startingFrame = self.startingFrame else {return}
     
        childView.layer.cornerRadius = 13
        childView.translatesAutoresizingMaskIntoConstraints = false
        self.viewController = viewController
        
        self.viewController.dismiss = {
            self.handledismiss()
        }
        
        
       // let tableGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        //self.viewController.view.addGestureRecognizer(tableGesture)
        
        
        
        
        let tableGesture = UIPanGestureRecognizer(target: self, action: #selector(handleGesture))
        tableGesture.delegate = self
        viewController.view.addGestureRecognizer(tableGesture)
        
        
        
        view.addSubview(childView)
        addChild(viewController)
        
        
        topAnchor = childView.topAnchor.constraint(equalTo: view.topAnchor,constant: startingFrame.origin.y)
        leadingAnchor = childView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: startingFrame.origin.x)
        heightAnchor = childView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        widthAnchor = childView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        
        
        
        [topAnchor,leadingAnchor,heightAnchor,widthAnchor].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
       
        
       
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 90)
            
            
            
           self.collectionView.isUserInteractionEnabled = false
            
            self.topAnchor?.constant = 0
            self.leadingAnchor?.constant = 0
            self.heightAnchor?.constant = self.view.frame.height
            self .widthAnchor?.constant =  self.view.frame.width
            self.view.layoutIfNeeded()
            
            
            let controller = viewController.tableView.cellForRow(at: [0,0]) as? tableHeaderCell
            controller?.header.topConstraint?.constant = 48
        }, completion:nil)
        
    }
    
    
    
    var startingFrame:CGRect?
    @objc func handledismiss(){
        self.navigationController?.navigationBar.isHidden = false
        UIView.animate(withDuration: 0.7, delay:0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            //gesture.view?.frame = self.startingFrame ?? .zero
        
            
            self.viewController.view.transform = .identity
            self.blurEffect.alpha = 0
            
            guard let startingFrame = self.startingFrame else{return}
            self.viewController.tableView.contentOffset = .zero
            
           
            
            self.topAnchor?.constant = startingFrame.origin.y
            self.leadingAnchor?.constant = startingFrame.origin.x
            self.heightAnchor?.constant = startingFrame.height
            self .widthAnchor?.constant =  startingFrame.width

            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.transform = .identity
            self.viewController.tableView.contentOffset = .zero
            
            let controller = self.viewController.tableView.cellForRow(at: [0,0]) as? tableHeaderCell
            controller?.header.topConstraint?.constant = 24
            //controller?.button.alpha = 0
             self.viewController.button .alpha  = 0
        }) { (_) in
           
            
            
            self.viewController.view.removeFromSuperview()
            self.viewController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: 450)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
