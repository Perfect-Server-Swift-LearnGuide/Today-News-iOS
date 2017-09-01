//
//  SegmentBaseViewController.swift
//  NavigationViewDemo
//
//  Created by Mac on 16/8/24.
//  Copyright © 2016年 Mac. All rights reserved.
//

import UIKit

class SegmentBaseViewController: UIViewController {

    /// 底部的所有内容
    lazy var contentView: UIScrollView = {
        let contentView = UIScrollView()
        contentView.frame = self.view.bounds
        contentView.y = 64 + 36
        contentView.height = UIScreen.main.bounds.height - contentView.y
        contentView.delegate = self
        contentView.isPagingEnabled = true
        self.view.insertSubview(contentView, at:0)
        contentView.contentSize = CGSize(width: contentView.width * CGFloat(self.childViewControllers.count), height: 0)
        return contentView
    }()
    
    let topNavView = SEKNavigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
extension SegmentBaseViewController: SEKNavigationViewDelegate {
    
    func navButtonClick(_ button: UIButton) {
        // 滚动
        var offset = self.contentView.contentOffset
        offset.x = CGFloat(button.tag) * self.contentView.width
        contentView.setContentOffset(offset, animated: true)
    }
    
    func navLeftButtonClick(_ button: UIButton) {
        _ = navigationController?.popViewController(animated: true)
        print("左")
    }
    
    func navRightButtonClick(_ button: UIButton) {
        print("右")
    }
}

extension SegmentBaseViewController: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        // 当前的索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        // 取出子控制器
        let vc = self.childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        vc.view.width = UIScreen.main.bounds.width
        scrollView.addSubview(vc.view)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndScrollingAnimation(scrollView)
        
        // 点击按钮
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        topNavView.titleClick(topNavView.titlesView.subviews[index] as! UIButton)
    }
}
