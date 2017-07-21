//
//  HomeViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import MJExtension
import SnapKit

class HomeViewController: SegmentBaseViewController {

    /// 分类数组
    lazy var categories = [HomeCategory]()
    
    /// 导航栏
    lazy var homeNavigationBar: HomeNavBarView = {
        let homeNavigationBar = HomeNavBarView()
        homeNavigationBar.searchBar.delegate = self
        return homeNavigationBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航栏
        setupNavBar()
        // 设置导航试图
        setupNavView()

        DataManager.dataFromSource(source: .HomeCategoryList, loadFinished: {(response) in
        
            if let data = response as? [String: AnyObject], let json = data["data"] {
                let categories = HomeCategory.mj_objectArray(withKeyValuesArray: json)
                self.categories = categories as AnyObject as! [HomeCategory]
                
                let titles = self.categories.map({ model in
                    model.title
                })
                self.topNavView.titles = titles
                self.setupChildVces(self.categories)
                // 底部的scrollView
                self.setupContentView()
            }
            
        })

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = App.Color.MainRed.color
    }
    
    /// 设置导航栏
    fileprivate func setupNavBar() {
        navigationController?.navigationBar.barStyle = .black
        navigationItem.titleView = homeNavigationBar
    }

    /// 设置导航视图
    fileprivate func setupNavView() {
        topNavView.frame = CGRect(x: 0, y: 64, width: self.view.width, height: 35)
        topNavView.backgroundColor = UIColor.white
        topNavView.delegate = self
        topNavView.titleButtonNormalColor = UIColor(red: 34 / 255.0, green: 34 / 255.0, blue: 34 / 255.0, alpha: 1.0)
        topNavView.titleButtonDisabledColor = App.Color.MainRed.color
        topNavView.titleButtonTitleFont = App.Font.Default.fontWithSize(size: 16)
        topNavView.titlesViewW = topNavView.width
        view.addSubview(topNavView)
        let line = UIView()
        line.backgroundColor = UIColor(red: 232 / 255.0, green: 232 / 255.0, blue: 232 / 255.0, alpha: 1.0)
        view.addSubview(line)
        line.snp.makeConstraints { (make) in
            make.top.equalTo(topNavView.snp.bottom)
            make.height.equalTo(1)
            make.left.right.equalTo(self.view)
        }
    }
    
    /// 初始化子控制器
    fileprivate func setupChildVces(_ models:[HomeCategory]) {
        for model in models {
            let topic = TopicPageViewController()
            topic.type = model.type
            addChildViewController(topic)
        }
        
    }
    /// 底部的scrollView
    fileprivate func setupContentView() {
        // 不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        // 添加第一个控制器的view
        self.scrollViewDidEndScrollingAnimation(contentView)
    }
    
    

}

extension HomeViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - UITextFieldDelegate
extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        navigationController?.pushViewController(UIViewController(), animated: false)
        return true
    }
}

// MARK: - Help func

extension HomeViewController {
    fileprivate func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        let alpha = CGFloat(1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}
