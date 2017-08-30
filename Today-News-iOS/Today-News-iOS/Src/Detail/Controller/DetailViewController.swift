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

    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUi()
        
        loadData()
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
        webView.backgroundColor = UIColor.white
        webView.scrollView.backgroundColor = UIColor.white
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        navItem(pos: .Left, action: #selector(DetailViewController.back), img: R.image.lefterbackicon_titlebar_24x24_())
        
        navItem(pos: .Right, action: #selector(DetailViewController.more), img: R.image.more_popver_black_24x24())

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
}
