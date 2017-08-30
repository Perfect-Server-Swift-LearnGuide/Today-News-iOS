//
//  CommentPublishView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/30.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class CommentPublishView: UIView, NibCreatable {

    
    @IBOutlet weak var commentTextView: SMKTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commentTextView.placeholder = "优质评论将会被优先展示"
    }

}
