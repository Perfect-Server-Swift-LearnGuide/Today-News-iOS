//
//  User.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/30.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object, RealmActionable {
    
    /// 用户注册时间
    dynamic var createtime = ""//"2017/08/28 07:48:29";
    
    /// 手机号
    dynamic var phone = ""
    
    /// 用户id
    dynamic var user_id = ""
    
}
