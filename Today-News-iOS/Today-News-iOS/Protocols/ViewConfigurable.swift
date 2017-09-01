//
//  ViewConfigurable.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

public protocol ViewConfigurable {
    
}

extension ViewConfigurable {
    
    /// cell 重用标识符
    var identifier: String {
        return String(describing: Self.self)
    }
    
    /// 根据model配置UITableViewCell，设置UITableViewCell内容
    func cell(source: AnyObject?, indexPath: IndexPath) {
        
    }
    
    
}

extension ViewConfigurable where Self: UIView {
    
    /// 根据model配置UIView，设置UIView内容
    func view(source: AnyObject?) {
        
    }
    
}
