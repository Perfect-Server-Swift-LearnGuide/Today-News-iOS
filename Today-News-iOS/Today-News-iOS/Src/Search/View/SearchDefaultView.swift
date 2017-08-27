//
//  SearchDefaultView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class SearchDefaultView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    class func searchDefaultView() -> SearchDefaultView {
        return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.last as! SearchDefaultView
    }
    
}
