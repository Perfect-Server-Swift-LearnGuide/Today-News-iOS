//
//  SearchNavigationView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

protocol SearchNavigationViewDelegate: class {
    func cancelButtonClicked(_ searchBar: UITextField)
}

/// 搜索界面导航栏
class SearchNavigationView: UIView {
    
    weak var delegate: SearchNavigationViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutUI()
    }
    
    /// 搜索框
    lazy var searchBar: HomeSearchBar = {
        let searchBar = HomeSearchBar.searchBar()
        searchBar.placeholder = "请输入关键字"
        searchBar.tintColor = App.Color.Black.color
        searchBar.background = UIImage(named: "searchbox_search_press_20x28_")
        return searchBar
    }()
    
    /// 取消按钮
    fileprivate lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("取消", for: .normal)
        cancelButton.setTitleColor(App.Color.LightBlue.color, for: .normal)
        cancelButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        cancelButton.addTarget(self, action: #selector(cancelButtonClick), for: .touchUpInside)
        return cancelButton
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI布局
extension SearchNavigationView {
    
    fileprivate func layoutUI() {
        
        // 添加搜索框
        addSubview(searchBar)
        // 添加取消按钮
        addSubview(cancelButton)
        // 搜索框
        
        let margin = 15.0
        
        searchBar.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(margin)
            make.right.equalTo(cancelButton.snp.left).offset(-margin)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
        }
        // 取消按钮
        cancelButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(self).offset(-margin)
            make.height.equalTo(searchBar)
        }
        searchBar.becomeFirstResponder()
    }
    
    /// 取消按钮点击
    @objc fileprivate func cancelButtonClick() {
        delegate?.cancelButtonClicked(searchBar)
    }
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            let newFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 44)
            super.frame = newFrame
        }
    }
}
