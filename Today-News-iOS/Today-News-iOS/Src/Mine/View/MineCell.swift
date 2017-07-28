//
//  MineCell.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class MineCell: UITableViewCell {

    /// 标题
    @IBOutlet weak var leftTextLabel: UILabel!

    /// 右侧标签
    @IBOutlet weak var rightTextLabel: UILabel!
    
}

extension MineCell: ViewConfigurable {
    
    func viewSourceWithModel(_ model: AnyObject?, indexPath: IndexPath) {
        guard let mine = model as? MineCellModel else {
            return
        }

        leftTextLabel.text = mine.text
        rightTextLabel.text = mine.grey_text
        
    }
    
}
