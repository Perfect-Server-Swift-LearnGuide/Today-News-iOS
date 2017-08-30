//
//  UIColorExtenstion.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/30.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit


extension UIColor {
    
    /// 生成随机色
    func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        let alpha = CGFloat(1.0)
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}

