//
//  MoreLoginViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/27.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class MoreLoginViewController: UIViewController {

    /// 顶部标题
    @IBOutlet weak var topLabel: UILabel!
    /// 发送验证码 View
    @IBOutlet weak var verifyCodeView: UIView!
    /// 找回密码 View
    @IBOutlet weak var findPasswordView: UIView!
    /// 手机号
    @IBOutlet weak var mobileTextField: UITextField!
    /// 密码 / 验证码
    @IBOutlet weak var passwordTextField: UITextField!
    /// 发送验证码 按钮
    @IBOutlet weak var sendVerifyCodeButton: UIButton!
    /// 找回密码 按钮
    @IBOutlet weak var findPasswordButton: UIButton!
    /// 未注册手机验证后自动登录
    @IBOutlet weak var middleTipLabel: UILabel!
    /// 登录方式按钮
    @IBOutlet weak var loginModeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginModeButton.setTitle("免密码登录", for: .selected)
        
    }
}

extension MoreLoginViewController {
    /// 关闭按钮点击
    @IBAction func closeLoginViewButtonClicked() {
        dismiss(animated: true, completion: nil)
    }
    
    /// 进入头条按钮点击
    @IBAction func goInTouTiaoButtonClicked() {
        
    }
    
    /// 登录方式按钮点击
    @IBAction func loginModeButonClicked(_ sender: UIButton) {
        loginModeButton.isSelected = !sender.isSelected
        verifyCodeView.isHidden = sender.isSelected
        findPasswordView.isHidden = !sender.isSelected
        middleTipLabel.isHidden = sender.isSelected
        passwordTextField.placeholder = sender.isSelected ? "密码" : "请输入验证码"
        topLabel.text = sender.isSelected ? "帐号密码登录" : "登录你的头条，精彩永不消失"
    }
}

extension MoreLoginViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}
