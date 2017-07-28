//
//  MineNoLoginHeaderView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

protocol NoLoginHeaderViewDelegate: class {
    
    /// 更多登录
    func moreLoginButotnClicked()
    
}

class MineNoLoginHeaderView: UIView {

    weak var delegate: NoLoginHeaderViewDelegate?
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func headerView() -> MineNoLoginHeaderView {
        let headerView = Bundle.main.loadNibNamed(String(describing: self), owner: nil
            , options: nil)?.first as! MineNoLoginHeaderView
        return headerView 
    }

    /// 更多登录方式按钮点击
    @IBAction func moreLoginButtonCLicked() {
        delegate?.moreLoginButotnClicked()
    }
}
