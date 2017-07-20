//
//  DataService.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation
import Alamofire


internal class DataService {
    
    typealias DataChecking = (_ data: Any?) -> ()

    
    /// HomeCategoryList
    class func homeCategoryList(_ uri: String, params:[String: Any], loadFinished: DataChecking?) {
        Alamofire.request(App.Uri.BaseUri.rawValue+uri, method: .get, parameters: params).responseJSON { (response) in
            guard let JSON = response.result.value else { return }
            loadFinished?(JSON)
        }
    }
    
    /// HomeCategoryContent
    class func homeCategoryContent(_ uri: String, params:[String: Any], loadFinished: DataChecking?) {
        Alamofire.request(App.Uri.BaseUri.rawValue+uri, method: .get, parameters: params).responseJSON { (response) in
            guard let JSON = response.result.value else { return }
            loadFinished?(JSON)
        }
    }
    
}
