//
//  AnimatedTransitioning.swift
//  testModal
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class AnimatedTransitioning: NSObject {

    var presented = false
    
    var duration = 0.5

    /// 弹出动画
    fileprivate func animatePresentedController(transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .to) else {
            return
        }
        toView.x = 0
        toView.y = UIScreen.main.bounds.height
        toView.width = UIScreen.main.bounds.width
        toView.height = UIScreen.main.bounds.height - 40
        
        transitionContext.containerView.addSubview(toView)
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.72, initialSpringVelocity: 0, options: .curveEaseOut, animations: {() -> Void in
            
            toView.y = 40

        }, completion: {(_) -> Void in
            transitionContext.completeTransition(true)
        })
    }
    
    /// 动画消失
    fileprivate func animateDismissedController(transitionContext: UIViewControllerContextTransitioning) {

        let fromView = transitionContext.view(forKey: .from)
        UIView.animate(withDuration: duration, animations: { () -> Void in
            
            fromView?.y = UIScreen.main.bounds.height
            
        }) { (_) -> Void in
            transitionContext.completeTransition(true)
        }
    }

}


extension AnimatedTransitioning: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if presented {
            animatePresentedController(transitionContext: transitionContext)
            
        } else {
            animateDismissedController(transitionContext: transitionContext)
        }
    }
}
