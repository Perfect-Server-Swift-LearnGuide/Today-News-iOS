//
//  NibCreatable.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/30.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation

protocol NibCreatable: class { }


extension NibCreatable where Self: Any {
    
    static func createFromNib(owner: Any? = nil) -> Self? {
        guard let nibName = nibName else {
            return nil
        }
        let bundleContents = Bundle.main
            .loadNibNamed(nibName, owner: owner, options: nil)
        guard let result = bundleContents?.last as? Self else {
            return nil }
        return result
    }
    
    static var nibName: String? {
        guard let n = NSStringFromClass(Self.self).components(separatedBy: ".").last else { return nil }
        return n
    }
}
