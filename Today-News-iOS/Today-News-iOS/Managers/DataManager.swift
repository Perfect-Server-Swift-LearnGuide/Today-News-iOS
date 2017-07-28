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
        
        case .UserTabs:
            DataService.userTabs(App.Uri.UserTabs.rawValue, params: [:], loadFinished: loadFinished)
            
        default:
            break
        }
        
    }

}
