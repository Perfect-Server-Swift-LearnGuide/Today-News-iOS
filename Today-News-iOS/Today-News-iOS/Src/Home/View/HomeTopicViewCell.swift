//
//  HomeTopicViewCell.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import SnapKit

class HomeTopicViewCell: UITableViewCell {

    /// 标题
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = App.Font.Default.fontWithSize(size: 16)
        self.contentView.addSubview(label)
        return label
    }()
    
    /// 特殊推荐
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutUI()
        
        testUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutUI() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-30)
            make.top.equalTo(self.contentView).offset(18)
        }
    }
    
    func testUI() {
        titleLabel.backgroundColor = UIColor.green
    }
    
}

extension HomeTopicViewCell: ViewConfigurable {
    
    func viewSourceWithModel(_ model: AnyObject?, indexPath: IndexPath) {
        guard let content = model as? HomeContent else {
            return
        }
        
        titleLabel.text = content.title
        
    }
    
}
