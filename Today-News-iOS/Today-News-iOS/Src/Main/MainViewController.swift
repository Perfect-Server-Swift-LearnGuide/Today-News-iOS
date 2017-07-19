//
//  MainViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        addChildViewControllers()
        
    }

    /// setupUI 
    private func setupUI() {
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
    }
}

extension MainViewController {
    
    /// 添加所有的控制器
    fileprivate func addChildViewControllers() {
        
        addChildViewController(HomeViewController(),
                               title: "首页",
                               image: R.image.home_tabbar_normal(),
                               selectImage: R.image.home_tabbar_select())
        
        addChildViewController(VideoViewController(),
                               title: "视频",
                               image: R.image.video_tabbar_normal(),
                               selectImage: R.image.video_tabbar_select())
        
        addChildViewController(MicroNewViewController(),
                               title: "微头条",
                               image: R.image.micronew_tabbar_normal(),
                               selectImage: R.image.micronew_tabbar_select())
        
        addChildViewController(MineViewController(),
                               title: "未登录",
                               image: R.image.no_login_tabbar_normal(),
                               selectImage: R.image.no_login_tabbar_select())
    }
    
    /// 添加控制器
    fileprivate func addChildViewController(_ childController: UIViewController, title: String, image: UIImage?, selectImage: UIImage?) {
    
        childController.tabBarItem.image = image
        childController.tabBarItem.selectedImage = selectImage
        childController.title = title
        let navC = UINavigationController(rootViewController: childController)
        addChildViewController(navC)
    }

}
