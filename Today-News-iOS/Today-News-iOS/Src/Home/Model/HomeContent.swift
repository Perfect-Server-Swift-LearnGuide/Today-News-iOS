//
//  HomeContent.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class HomeContent: NSObject {
    /// 创建时间
    var createtime = ""
    /// 文章标题
    var title = ""
    /// 文章类型
    var type = 1
    /// 文章来源
    var source = ""
    /// 评论数量
    var comment_count = 0
    /// 文章图片
    var thumbnails: [String] = []
    /// 文章id
    var article_id = ""
}
