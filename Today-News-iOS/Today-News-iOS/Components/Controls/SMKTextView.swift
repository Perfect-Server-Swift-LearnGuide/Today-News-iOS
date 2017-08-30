//
//  SMKTextView.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/28.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class SMKTextView: UITextView {

    /** 占位文字 */
    var placeholder: NSString = "" {
        didSet {
            setNeedsDisplay()
        }
    }
    /** 占位文字的颜色 */
    var placeholderColor = UIColor.gray {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(SMKTextView.textDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }
    
    /**
     * 监听文字改变
     */
    func textDidChange() {
        // 重绘（重新调用）
        setNeedsDisplay()
    }
    
    override var text: String! {
        didSet {
            super.text = text
            setNeedsDisplay()
        }
    }
    override var attributedText: NSAttributedString! {
        didSet {
            super.attributedText = attributedText
            setNeedsDisplay()
        }
    }

    override var font: UIFont? {
        didSet {
            super.font = font
            setNeedsLayout()
        }
    }
    

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // 如果有输入文字，就直接返回，不画占位文字
        if self.hasText {return}
        
        // 文字属性
        let attrs: [String : NSObject] = [NSFontAttributeName : self.font!, NSForegroundColorAttributeName : self.placeholderColor]
        
        // 画文字
        let x:CGFloat = 5
        let w: CGFloat = rect.size.width - 2 * x
        let h: CGFloat = 18
        let y:CGFloat = (rect.height - h) * 0.5
        let placeholderRect: CGRect = CGRect(x: x, y: y, width: w, height: h)
        self.placeholder.draw(in: placeholderRect, withAttributes: attrs)

    }

}
