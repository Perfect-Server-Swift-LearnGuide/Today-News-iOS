//
//  Detail.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/29.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class Detail: NSObject {

    /// 新闻详情
    var content = ""
    
    /// 新闻id
    var article_id = ""
    
    /// 创建时间
    var createtime = "" //"2017/07/16 08:51:40
    
    /// 文章来源
    var source = "" //搜狐新闻
    
    /// 评论数量
    var comment_count	 = 0
    
    /// 新闻标题
    var title	= ""
    
    /// 新闻分类
    var type	 = 0
    
    /// 新闻分类
    var category = ""
    
    /// 介绍缩略图
    var thumbnails = [[String: String]]()
    
}
