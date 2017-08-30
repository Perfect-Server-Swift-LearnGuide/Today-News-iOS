//
//  DetailViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/8/28.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var homeContent: HomeContent?
    
    var detail: Detail?
    
    lazy var commentPublish: CommentPublishView = {
        let comment = CommentPublishView.createFromNib()
        return comment!
    }()

    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUi()
        
        layoutUI()
        
        loadData()
        
        // 键盘通知
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.keyboardChange(noti:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }

    @IBAction func editCommentAction(_ sender: UIButton) {
        commentPublish.commentTextView.becomeFirstResponder()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

// MARK: -数据处理
extension DetailViewController {
    func loadData() {
        let params = [
            "article_id" : homeContent!.article_id
        ]
        DataManager.dataFromSource(source: .Detail(params: params), loadFinished: { (response) in
            if let data = response as? [String: AnyObject], let json = data["data"], let content = json["content"] as? String {
                
                self.detail = Detail.mj_object(withKeyValues: json)
                self.navigationItem.title = self.detail?.source
                self.webView.loadHTMLString(content, baseURL: nil)
            }
        })
    }
}

// MARK: - 生命周期
extension DetailViewController {
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        // 设置导航栏属性
        navigationController?.navigationBar.barStyle = .black
    }
    

}

// MARK: - UI
extension DetailViewController {
    
    func setupUi() {
        webView.backgroundColor = UIColor.clear
        webView.scrollView.backgroundColor = UIColor.white
        webView.scrollView.keyboardDismissMode = .interactive
        webView.isOpaque = false
        
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.view.addSubview(commentPublish)
        
        navItem(pos: .Left, action: #selector(DetailViewController.back), img: R.image.lefterbackicon_titlebar_24x24_())
        
        navItem(pos: .Right, action: #selector(DetailViewController.more), img: R.image.more_popver_black_24x24())

    }
    
    func layoutUI() {
        commentPublish.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(45)
            make.top.equalTo(self.view.snp.bottom)
        }
    }
}

extension DetailViewController: NavigatorConfigurable {}

// MARK: - Event
extension DetailViewController {
    
    func back() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func more() {
        
    }
    
    func keyboardChange(noti: NSNotification) {
        let userInfo = noti.userInfo
        let duration = userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? Double
        let keyboardF = userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue

        // 执行动画
        UIView.animate(withDuration: duration!, animations: {
            if keyboardF!.cgRectValue.minY >= self.view.height {
                // 键盘消失
                self.commentPublish.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.view.snp.bottom)
                })
            } else {
                self.commentPublish.snp.updateConstraints({ (make) in
                    make.top.equalTo(self.view.snp.bottom).offset(-(45.0 + keyboardF!.cgRectValue.height))
                })
            }
        })
        
        self.view.layoutIfNeeded()
        
    }
}
