//
//  TodayTableViewController.swift
//  AppStore
//
//  Created by Fuad Hasan on 9/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//
import UIKit

class TableViewController:UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let cellId = "cellId"
    
    
    var result:TodayModel!
    
    var dismiss:(()->())?
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
       // print(tableView.contentOffset.y)
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y < 0 {
            tableView.isScrollEnabled = false
            tableView.isScrollEnabled = true
        }
        let height = UIApplication.shared.statusBarFrame.height
        var constant:CGAffineTransform =  .identity

        if scrollView.contentOffset.y > 200 {
            constant = .init(translationX: 0, y: -90 - height)
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
                self.contentView.transform = constant
                
            })
        }
        else{
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
                self.contentView.transform = .identity
                
            })
        }
    }
    
    
    
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    let button:UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        button.tintColor = UIColor.darkGray
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        return button
    }()
    
    let imageView:UIImageView = {
       let image = UIImageView(image: #imageLiteral(resourceName: "garden"))
        image.layer.cornerRadius = 4
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    
    let titleLabel = UILabel(text: "Life Hack", font: .boldSystemFont(ofSize:18 ))
    let descrip = UILabel(text: "Utilizing Your time", font: .systemFont(ofSize: 15))
    
    let getButton = UIButton(title: "GET", cornerRadius: 15)
    
    let contentView = UIView()
    
    
    
    
    
    let blurEffect = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.clipsToBounds = true
        view.addSubview(tableView)
        tableView.fillSuperview()
        
       // view.addSubview(tableView)
        view.addSubview(button)
        tableView.fillSuperview()
       button.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor,padding: .init(top: 20, left: 0, bottom: 0, right: 12),size: .init(width: 40, height: 60))
        
        view.addSubview(contentView)
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        contentView.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 12, bottom: -90, right: 12),size: .init(width: 0, height: 75))
        contentView.addSubview(blurEffect)
        blurEffect.fillSuperview()
        let stackView = UIStackView(addArrangedSubviews: [imageView,VerticalStackView(views: [titleLabel,descrip], spacing: 5),getButton], spacing: 10)
       
        
        
        imageView.constrainWidth(constant: 60)
        imageView.constrainHeight(constant: 60)
       imageView.clipsToBounds = true
        
        getButton.backgroundColor = .darkGray
        getButton.constrainWidth(constant: 70)
        
        contentView.addSubview(stackView)
        stackView.alignment = .center
        stackView.fillSuperview(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = .init(top: 0, left: 0, bottom: 12, right: 0)
        tableView.allowsSelection = false
    }
   
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let tableViewCell = tableHeaderCell()
           //tableViewCell.button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            tableViewCell.header.result = self.result
            return tableViewCell

        }
        let cell = TodayDescriptionCell()
        //cell.textLabel?.text = "Cell"
        return cell
    }
    
    @objc func handleDismiss(button:UIButton){
       // button.alpha = 1
        self.dismiss?()
        
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
       return 450
        }else{
            return UITableView.automaticDimension
        }
    }
    
    
    }
