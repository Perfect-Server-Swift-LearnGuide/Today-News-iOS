//
//  SEKView+Frame.swift
//  SwiftExtensionKitDemo
//
//  Created by yuantao on 16/3/3.
//  Copyright © 2016年 momo. All rights reserved.
//

import UIKit

public extension UIView{
    public var x : CGFloat {
        set(value){
            var frame = self.frame
            frame.origin.x = value
            self.frame = frame
        }
        get{
            return self.frame.origin.x
        }
    }
    
    public var right : CGFloat{
        set(value){
            var frame = self.frame
            frame.origin.x = value - frame.size.width
            self.frame = frame
        }
        get{
            return self.frame.origin.x + self.frame.size.width
        }
    }
    
    public var y :CGFloat{
        set(value){
            var frame = self.frame
            frame.origin.y = value
            self.frame = frame
        }
        get{
            return self.frame.origin.y
        }
    }
    
    public var bottom : CGFloat{
        set(value){
            var frame = self.frame
            frame.origin.y = value - frame.size.height
            self.frame = frame
        }
        get{
            return self.frame.origin.y + self.frame.size.height
        }
    }
    
    public var centerX : CGFloat{
        set(value){
            self.center = CGPoint(x: value, y: self.center.y)
        }
        get{
            return self.center.x
        }
    }
    
    public var centerY : CGFloat{
        set(value){
            self.center = CGPoint(x: self.center.x, y: value)
        }
        get{
            return self.center.y
        }
    }
    
    public var width : CGFloat{
        set(value){
            var frame = self.frame
            frame.size.width = value
            self.frame = frame
        }
        get{
            return self.frame.size.width
        }
    }
    
    public var height : CGFloat{
        set(value){
            var frame = self.frame
            frame.size.height = value
            self.frame = frame
        }
        get{
            return self.frame.size.height
        }
    }
    
    public var size : CGSize {
        set(value){
            var frame = self.frame
            frame.size = value
            self.frame = frame
        }
        get{
            return self.frame.size
        }
    }
    
    public var origin : CGPoint {
        set(value){
            var frame = self.frame
            frame.origin = value
            self.frame = frame
        }
        get{
            return self.frame.origin
        }
    }
    
    func isShowingOnKeyWindow() -> Bool {
        // 主窗口
        let keyWindow = UIApplication.shared.keyWindow
        
        // 以主窗口左上角为坐标原点, 计算self的矩形框
        let newFrame = keyWindow?.convert(self.frame, from: self.superview)
        let winBounds = keyWindow?.bounds
        
        // 主窗口的bounds 和 self的矩形框 是否有重叠
        let intersects = newFrame!.intersects(winBounds!)
        
        return !self.isHidden && self.alpha > 0.01 && self.window == keyWindow && intersects
    }
}
