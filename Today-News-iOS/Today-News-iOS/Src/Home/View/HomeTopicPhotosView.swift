//
//  HomeTopicPhotosView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/26.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTopicPhotosView: UIView {
    
    public var photos: [String] = [] {
        didSet{
            let _ = self.subviews.map { image in
                image.removeFromSuperview()
            }
            
            for imageUrl in photos {
                let imageView = UIImageView()
                if let url = URL(string: imageUrl) {
                    imageView.kf.setImage(with: url)
                }
                imageView.contentMode = .scaleAspectFill
                imageView.backgroundColor = UIColor.lightGray
                imageView.clipsToBounds = true
                self.addSubview(imageView)
            }
        }
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let magin: CGFloat = 4.0
        let width: CGFloat = (self.width - 2 * magin) / 3
        for index in 0 ..< self.subviews.count {
            if let imageView = self.subviews[index] as? UIImageView {
                imageView.x = CGFloat(index) * (width + magin)
                imageView.y = 0
                imageView.width = width
                imageView.height = self.height
            }
        }
    }

}
