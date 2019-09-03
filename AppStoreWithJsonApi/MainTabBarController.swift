//
//  BaseTabBarController.swift
//  AppStore
//
//  Created by Fuad Hasan on 4/8/19.
//  Copyright © 2019 Fuad Hasan. All rights reserved.
//

import UIKit

class MainTabBarController:UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        
        viewControllers = [createTabBarController(viewController: MusicController(), imageNmae:"music", title: "Music"),
          createTabBarController(viewController: TodayController(), imageNmae: "today_icon", title: "Today"),createTabBarController(viewController: AppsViewController(), imageNmae: "apps", title: "Apps"),createTabBarController(viewController: SearchBarController(), imageNmae:"search",title: "Search"),]
        }
    
    
    fileprivate func createTabBarController(viewController:UIViewController,imageNmae: String,title:String) -> UIViewController {
        
        print("ok")
        
        let navViewController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        navViewController.tabBarItem.title = title
        viewController.view.backgroundColor = .white
        navViewController.tabBarItem.image = UIImage(named:imageNmae)
       // navViewController.tabBarItem.image = imageNmae
        navViewController.navigationBar.prefersLargeTitles = true
        return navViewController
        
    }
    
}
