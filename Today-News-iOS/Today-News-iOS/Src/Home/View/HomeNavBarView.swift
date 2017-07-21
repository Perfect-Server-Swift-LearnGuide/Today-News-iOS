//
//  HomeNavBarView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import SnapKit

class HomeNavBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 添加今日头条 图片
        addSubview(toutiaoImageView)
        // 添加 搜索框
        addSubview(searchBar)
        
        toutiaoImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self)
            make.size.equalTo(CGSize(width: 72, height: 20))
        }
        
        searchBar.snp.makeConstraints { (make) in
            make.left.equalTo(toutiaoImageView.snp.right).offset(15)
            make.right.equalTo(self).offset(-15)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 今日头条 图片
    lazy var toutiaoImageView: UIImageView = {
        let toutiaoImageView = UIImageView(image: R.image.title_72x20_())
        toutiaoImageView.contentMode = .scaleAspectFill
        return toutiaoImageView
    }()
    
    /// 搜索框
    lazy var searchBar: HomeSearchBar = {
        let searchBar = HomeSearchBar.searchBar()
        searchBar.placeholder = "搜你想搜的"
        searchBar.background = R.image.searchbox_search_20x28_()
        return searchBar
    }()
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            let newFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
            super.frame = newFrame
        }
    }
        
}



