//
//  PresentationController.swift
//  testModal
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {

    lazy var shadowView: UIVisualEffectView? = {
        let blur  = UIBlurEffect(style: .light)
        let shadow = UIVisualEffectView(effect: blur)
        shadow.alpha = 0.2
        shadow.backgroundColor = UIColor.gray
        let tap = UITapGestureRecognizer(target: self, action: #selector(PresentationController.tapShadow(tap:)))
        shadow.addGestureRecognizer(tap)
        return shadow
    }()
    
    override func presentationTransitionWillBegin() {
        presentedView?.frame = (containerView?.bounds)!
        shadowView?.frame = (containerView?.bounds)!
        containerView?.addSubview(shadowView!)
        containerView?.addSubview(presentedView!)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        if (!completed) {
            shadowView?.removeFromSuperview()
        }
    }
    
    override func dismissalTransitionWillBegin() {
        shadowView?.alpha = 0.0
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            shadowView?.removeFromSuperview()
            presentedView?.removeFromSuperview()
        }
    }
    
    func tapShadow(tap: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
    
}
