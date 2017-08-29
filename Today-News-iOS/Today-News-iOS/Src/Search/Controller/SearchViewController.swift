//
//  SearchViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var weitoutiaos = [NSObject]()
    
    var offset: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    // 导航栏
    fileprivate lazy var searchNavigationView: SearchNavigationView = {
        let searchNavigationView = SearchNavigationView()
        searchNavigationView.delegate = self
        return searchNavigationView
    }()
    
    // 搜索界面默认的背景
    fileprivate lazy var searchDefaultView: SearchDefaultView = {
        let searchDefaultView = SearchDefaultView.searchDefaultView()
        searchDefaultView.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 180)
        return searchDefaultView
    }()
    

}

// MARK: - 生命周期
extension SearchViewController {
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // 设置导航栏属性
        navigationController?.navigationBar.barStyle = .black
    }
}

extension SearchViewController {
    
    fileprivate func setupUI() {
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = UIColor.white
        view.backgroundColor = UIColor.white
        // 隐藏返回按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
        // 设置自定义导航视图
        navigationItem.titleView = searchNavigationView
        // 添加背景 View
        view.addSubview(searchDefaultView)
        
    }
}

// MARK: - SearchNavigationViewDelegate
extension SearchViewController: SearchNavigationViewDelegate, UITextFieldDelegate {
    
    /// 导航栏取消按钮点击
    func cancelButtonClicked(_ searchBar: UITextField) {
        searchBar.resignFirstResponder()
         _ = navigationController?.popViewController(animated: true)
    }
    
}
