//
//  AppConstants.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import SwiftHEXColors
import RealmSwift

/// Realm 数据库
var realm: Realm! = {
    do {
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        Realm.Configuration.defaultConfiguration = config
        
        return try Realm()
    } catch (let error as NSError) {
        "架构迁移失败，请删除本App后重新安装".show(WithType: .Error)
        UIView.animate(withDuration: 0.5, delay: 1, options: [.curveEaseOut], animations: {
            UIApplication.shared.keyWindow?.bounds = CGRect()
        }, completion: { finished in
            exit(0)
        })
        return nil
    }
}()

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
        /// 主题灰
        case MainBgGray = "#F5F5F5"
        /// 表格分割线
        case MainTableSepGray = "#F0F0F0"
        /// 黑色
        case Black = "#000000"
        /// 搜索取消蓝色
        case LightBlue = "#288DCE"
        
        /// 获取颜色
        var color: UIColor { return UIColor(hexString: rawValue) ?? UIColor.clear }
    }
    
    /// 数据源
    enum DataSource {
        /// 首页分类标题
        case HomeCategoryList
        /// 首页内容
        case HomeCategoryContent(params: [String: Any])
        /// 用户-我的
        case UserTab
        /// 用户注册
        case Register(params: [String: Any])
        /// 用户登录
        case Login(params: [String: Any])
        /// 新闻详情
        case Detail(params: [String: Any])
    }
    
    /// 服务器基础 URi
    enum Uri: String {
        /// 服务器基础Uri
//        case BaseUri = "http://lovemo.frp1.chuantou.org/Api/"
        case BaseUri = "http://127.0.0.1:8181/Api/"
        /// 首页分类标题
        case HomeCategoryList = "article/category"
        /// 首页内容
        case HomeCategoryContent = "article/content"
        /// 用户-我的
        case UserTab = "user/tab"
        /// 用户-注册
        case Register = "user/register"
        /// 用户-登录
        case Login = "user/login"
        /// 新闻详情
        case Detail = "article/detail"
        
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
