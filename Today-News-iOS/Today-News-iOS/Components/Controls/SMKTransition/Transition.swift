//
//  Transition.swift
//  testModal
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class Transition: NSObject, UIViewControllerTransitioningDelegate {

    private static let manager: Transition = Transition()
    
    open class func shareManager() -> Transition {
        return manager
    }

}


extension Transition  {
    //该代理方法用于返回负责转场的控制器对象
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    //该代理方法用于告诉系统谁来负责控制器如何弹出
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //当弹窗要弹出的时候就会调用该方法
        let anim = AnimatedTransitioning()
        anim.presented = true
        return anim
    }
    
    //该代理方法用于告诉系统谁来负责控制器如何消失
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //当弹窗要消失的时候就会调用该方法
        let anim = AnimatedTransitioning()
        anim.presented = false
        return anim
    }
 }
