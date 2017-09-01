//
//  MineLoginHeaderView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/31.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class MineLoginHeaderView: UIView, NibCreatable, ViewConfigurable {

    /// 头像
    @IBOutlet weak var bgImageView: UIImageView!
    
    /// 动态
    @IBOutlet weak var dynamicLabel: UILabel!
    
    /// 粉丝
    @IBOutlet weak var fansLabel: UILabel!
    
    /// 访客
    @IBOutlet weak var visitorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func view(source: AnyObject?) {
        guard let user = source as? User else {return}
        
        dynamicLabel.text = "\(user.dynamic)"
        fansLabel.text = "\(user.fans)"
        visitorLabel.text = "\(user.visitor)"
    }
    
}
