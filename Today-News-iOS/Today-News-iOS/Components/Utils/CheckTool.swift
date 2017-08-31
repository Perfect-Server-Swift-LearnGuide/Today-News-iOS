//
//  CheckTool.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation

class CheckTool {
    
    static let check = CheckTool()
    
    open class var share: CheckTool  {
        get {
            return check
        }
    }
    
    func checkPhone(phone: String) -> Bool {
        let regex = "^1[3-9]\\d{9}$"
        let regexPhone = NSPredicate(format: "SELF MATCHES %@",regex)
        return regexPhone.evaluate(with: phone)
    }
    

}


