//
//  AppConstants.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit


enum App {
    
    // MARK: - Enumerations
    
    /// 字体
    enum Font: String {
        case Default = "PingFangSC"
        
        /// 应用字体风格
        enum Style {
            case Ultralight
            case Regular
            case Semibold
            case Thin
            case Light
            case Medium
        }
        
        func fontWithSize(size: CGFloat, ofType type: Style = .Regular) -> UIFont {
            return UIFont(name: "\(self.rawValue)-\(String(describing: type))", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
    /// 数据源
    enum DataSource {
        /// 首页分类标题
        case HomeCategoryList([String: Any])

    }
    
    /// 服务器基础 URi
    enum Uri: String {
        /// 服务器基础Uri
        case BaseUri = "http://127.0.0.1:8181/Api/"
         /// 首页分类标题
        case HomeCategoryList = "article/category"
    }
    
    // MARK: Methods
    
    static var isSimulator: Bool {
        #if arch(i386) || arch(x86_64)
            return true
        #else
            return false
        #endif
    }
}
