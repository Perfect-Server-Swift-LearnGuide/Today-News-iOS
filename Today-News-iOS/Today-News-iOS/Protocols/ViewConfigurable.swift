//
//  ViewConfigurable.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

@objc public protocol ViewConfigurable {
    
    /// cell 重用标识符
    @objc optional var identifier: String { get set }
    
    /**
     *  根据model配置UIView，设置UIView内容
     */
    @objc optional func viewSourceWithModel(_ model: AnyObject?)
    
    /**
     *  根据model配置UITableViewCell，设置UITableViewCell内容
     */
    @objc optional func viewSourceWithModel(_ model: AnyObject?, indexPath: IndexPath)
    
}

extension ViewConfigurable where Self : UITableViewCell {
    var identifier: String {
        return String(describing: Self.self)
    }
}
