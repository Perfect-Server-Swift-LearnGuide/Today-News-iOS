//
//  DataManager.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation

class DataManager {
    
     typealias DataChecking = (_ data: Any?) -> ()
    
    class func dataFromSource(source: App.DataSource, loadFinished: DataChecking?) {
        
        switch source {
            
        case .HomeCategoryList:
            DataService.homeCategoryList(App.Uri.HomeCategoryList.rawValue, params: [:], loadFinished: loadFinished)
            
        case let .HomeCategoryContent(params):
            DataService.homeCategoryContent(App.Uri.HomeCategoryContent.rawValue, params: params, loadFinished: loadFinished)
        
        case .UserTab:
            DataService.userTabs(App.Uri.UserTab.rawValue, params: [:], loadFinished: loadFinished)
            
        case let .Register(params):
            DataService.register(App.Uri.Register.rawValue, params: params, loadFinished: loadFinished)
        
        case let .Login(params):
            DataService.register(App.Uri.Login.rawValue, params: params, loadFinished: loadFinished)
            
        default:
            break
        }
        
    }

}
