//
//  AppConstants.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import SwiftHEXColors


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
    
    /// 颜色
    enum Color: String {
        /// 全局红
        case MainRed = "#D23F42"
        /// 小标题灰
        case MainGray = "#999999"
        
        /// 获取颜色
        var color: UIColor { return UIColor(hexString: rawValue) ?? UIColor.clear }
    }
    
    /// 数据源
    enum DataSource {
        /// 首页分类标题
        case HomeCategoryList
        /// 首页内容
        case HomeCategoryContent(params: [String: Any])

    }
    
    /// 服务器基础 URi
    enum Uri: String {
        /// 服务器基础Uri
        case BaseUri = "http://127.0.0.1:8181/Api/"
        /// 首页分类标题
        case HomeCategoryList = "article/category"
        /// 首页内容
        case HomeCategoryContent = "article/content"
        
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
