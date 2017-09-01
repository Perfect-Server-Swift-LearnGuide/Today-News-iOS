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
    
    /// 特殊推荐: 广告、热、影视、置顶
    lazy var flagLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.Default.fontWithSize(size: 11)
        label.layer.cornerRadius = 2
        label.layer.masksToBounds = true
        label.layer.borderColor = App.Color.MainRed.color.cgColor
        label.textColor = App.Color.MainRed.color
        label.layer.borderWidth = 0.5
        label.textAlignment = .center
        self.contentView.addSubview(label)
        return label
    }()
    
    /// 来源
    lazy var sourceLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.Default.fontWithSize(size: 11)
        label.textColor = App.Color.MainGray.color
        self.contentView.addSubview(label)
        return label
    }()
    
    /// 评论
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.Default.fontWithSize(size: 11)
        label.textColor = App.Color.MainGray.color
        self.contentView.addSubview(label)
        return label
    }()
    
    /// 时间
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.font = App.Font.Default.fontWithSize(size: 11)
        label.textColor = App.Color.MainGray.color
        self.contentView.addSubview(label)
        return label
    }()
    
    /// 删除按钮
    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.adjustsImageWhenHighlighted = false
        button.setImage(R.image.add_textpage_17x12_(), for: .normal)
        self.contentView.addSubview(button)
        return button
    }()
    
    /// 图片视图
    lazy var topicPhotosView: HomeTopicPhotosView = {
        let photosView = HomeTopicPhotosView()
        photosView.backgroundColor = UIColor.white
        photosView.isHidden = true
        self.contentView.addSubview(photosView)
        return photosView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        self.selectionStyle = .none
        
        layoutUI()
        
        testUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
}

extension HomeTopicViewCell: ViewConfigurable {
    func cell(source: AnyObject?, indexPath: IndexPath) {
        guard let content = source as? HomeContent else {
            return
        }
        
        titleLabel.text = content.title
        flagLabel.text = "置顶"
        sourceLabel.text = content.source
        commentLabel.text = "\(content.comment_count)评论"
        timeLabel.text = content.createtime
        if content.thumbnails.count > 0 {
            topicPhotosView.isHidden = false
            topicPhotosView.photos = content.thumbnails
            self.contentView.snp.remakeConstraints { (make) in
                make.edges.equalTo(self.snp.edges)
                make.bottom.equalTo(topicPhotosView).offset(14)
            }
        } else {
            topicPhotosView.isHidden = true
            self.contentView.snp.remakeConstraints { (make) in
                make.edges.equalTo(self.snp.edges)
                make.bottom.equalTo(deleteButton).offset(14)
            }
        }
    }
    
}

// MARK: - UI布局
extension HomeTopicViewCell {
    func layoutUI() {
        
        self.contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.snp.edges)
            make.bottom.equalTo(deleteButton).offset(14)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.contentView).offset(15)
            make.right.equalTo(self.contentView).offset(-30)
            make.top.equalTo(self.contentView).offset(18)
        }
        
        flagLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.height.equalTo(14)
            make.width.equalTo(27)
        }
        
        sourceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.flagLabel.snp.right).offset(5)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.height.equalTo(14)
        }
        
        commentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.sourceLabel.snp.right).offset(9)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.height.equalTo(14)
        }
        
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.commentLabel.snp.right).offset(7)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.height.equalTo(14)
        }
        
        deleteButton.snp.makeConstraints { (make) in
            make.right.equalTo(self.contentView).offset(-14)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5)
            make.width.equalTo(17)
            make.height.equalTo(14)
        }
        
        topicPhotosView.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel)
            make.right.equalTo(self.contentView).offset(-30)
            make.height.equalTo(62)
            make.top.equalTo(timeLabel.snp.bottom).offset(5)
        }
        
    }
    
    func testUI() {
        //        titleLabel.backgroundColor = UIColor.green
    }
}
