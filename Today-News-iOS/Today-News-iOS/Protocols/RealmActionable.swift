//
//  RealmActionable.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/31.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmActionable: class {}

extension RealmActionable where Self: Object {

    func write() {
        try! realm?.write {
            realm?.add(self)
        }
        
        print("数据库：\(self)    \n 存储路径：\(log())")
    }
    
    func log() -> String {
        return try! Realm().configuration.fileURL?.path ?? NSHomeDirectory()
    }
    
    static var realm: Realm {
        return try! Realm()
    }
}
