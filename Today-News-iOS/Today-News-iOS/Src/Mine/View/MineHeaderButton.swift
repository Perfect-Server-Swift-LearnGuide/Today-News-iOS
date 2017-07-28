//
//  MineVerticalButton.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class MineVerticalButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        self.titleLabel?.textAlignment = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // imageView
        
        imageView?.centerX = self.width * 0.5
        imageView?.y = 8
        imageView?.height = 23
        imageView?.width = 23

        // textLabel
        
        titleLabel?.x = 0
        titleLabel?.y = (imageView?.frame.maxY)! + 7
        titleLabel?.height = 12
        titleLabel?.width = self.width

    }
    
}
