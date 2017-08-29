//
//  NavigatorConfigurable.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/29.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

enum NavigatorItemPosition {
    case Left
    case Right
}

protocol NavigatorConfigurable: class { }

extension NavigatorConfigurable where Self: UIViewController {

    func navItem(pos: NavigatorItemPosition, action: Selector, img: UIImage?) {
        let button = UIButton(type: .custom)
        button.setBackgroundImage(img, for: .normal)
        button.addTarget(self, action: action, for: .touchUpInside)
        button.sizeToFit()
        switch pos {
        case .Left:
            button.titleLabel?.textAlignment = .left
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .Right:
            button.titleLabel?.textAlignment = .right
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }

}
