//
//  CALayerExtenstion.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

extension CALayer {

    
    var borderColorFromUIColor:UIColor{
        set(color){
            self.borderColor = color.cgColor;
        }
        
        get{
            return UIColor(cgColor:self.borderColor!)
        }
    }
    
}

