//
//  HUD.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/31.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import Foundation
import SVProgressHUD

enum HUDType {
    case Default
    case Success
    case Info
    case Error
    case Progress(progress: Float)
}

extension String {
    
    func show(WithType type: HUDType = .Default, maskType: SVProgressHUDMaskType = .none) {
        SVProgressHUD.setDefaultMaskType(maskType)
        switch type {
        case .Default:
            SVProgressHUD.show(withStatus: self)
        case .Success:
            SVProgressHUD.showSuccess(withStatus: self)
        case .Info:
            SVProgressHUD.showInfo(withStatus: self)
        case .Error:
            SVProgressHUD.showError(withStatus: self)
        case let .Progress(progress):
            SVProgressHUD.showProgress(progress, status: self)
        }
    }
}

class HUD {
    class func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    class func config() {
        SVProgressHUD.setMinimumDismissTimeInterval(2)
    }
}
