//
//  TopicPageViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell
import MJRefresh

class TopicPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    /// 文章内容
    lazy var contents: NSMutableArray = NSMutableArray()
    /// 文章类型
    public var type = 1
    /// 当前页码
    var page = 1
    /// 上次选中的索引(或者控制器)
    var lastSelectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        automaticallyAdjustsScrollViewInsets = false
        
        // 初始化设置tableView
        setupTableView()
 
    }

}

//MARK: - load data
extension TopicPageViewController {
    func loadNewData() {
        tableView.mj_footer.endRefreshing()
        tableView.mj_footer.resetNoMoreData()
        
        self.page = 1
        let params:[String: Any] = [
            "type" : self.type,
            "page" : self.page
        ]
        DataManager.dataFromSource(source: .HomeCategoryContent(params: params), loadFinished: { (response) in
            if let data = response as? [String: AnyObject], let json = data["data"] {
                self.contents = HomeContent.mj_objectArray(withKeyValuesArray: json)
                self.tableView.reloadData()
            }
            
            self.tableView.mj_header.endRefreshing()
            if let data = response as? [String: AnyObject], let total = data["total"] as? Int {
                if self.contents.count == total {
                    self.tableView.mj_footer.endRefreshingWithNoMoreData()
                }
            }

        })
        
    }
    
    func loadMoreData() {
        tableView.mj_header.endRefreshing()
        let page = self.page + 1
        let params:[String: Any] = [
            "type" : self.type,
            "page" : page
        ]
        DataManager.dataFromSource(source: .HomeCategoryContent(params: params), loadFinished: { (response) in
            if let data = response as? [String: AnyObject], let json = data["data"] {
                let contents = HomeContent.mj_objectArray(withKeyValuesArray: json) as [AnyObject]
                self.contents.addObjects(from: contents)
                self.tableView.reloadData()
            }
            if let data = response as? [String: AnyObject], let total = data["total"] as? Int {
                if self.contents.count == total {
                    self.tableView.mj_footer.endRefreshingWithNoMoreData()
                }
            } else {
                self.tableView.mj_footer.endRefreshing()
            }
            self.page = page
        })
    }
}

//MARK: - setup TableView
extension TopicPageViewController {
    func setupTableView() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(TopicPageViewController.loadNewData))
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(TopicPageViewController.loadMoreData))
        tableView.mj_header.isAutomaticallyChangeAlpha = true
        tableView.mj_header.beginRefreshing()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 88, right: 0)
        tableView.register(HomeTopicViewCell.classForCoder(), forCellReuseIdentifier: String(describing: HomeTopicViewCell.self))
        tableView.tableFooterView = UIView()
    }
}

//MARK: - tableView dataSource
extension TopicPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.mj_footer.isHidden = (contents.count == 0)
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = contents[indexPath.row] as AnyObject?,  let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTopicViewCell.self), for: indexPath) as? ViewConfigurable else { fatalError("无法构建 Cell") }
        cell.viewSourceWithModel!(data, indexPath: indexPath as IndexPath)
        
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        guard let data = contents[indexPath.row] as AnyObject? else { fatalError("解析数据失败") }
        return tableView.fd_heightForCell(withIdentifier:  String(describing: HomeTopicViewCell.self), cacheBy: indexPath) { cell in
            if let cell = cell as? ViewConfigurable {
                cell.viewSourceWithModel!(data, indexPath: indexPath as IndexPath)
            }
        }
    }
    
    
}

//MARK: - tableView delegate
extension TopicPageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let data = contents[indexPath.row] as? HomeContent else { fatalError("解析数据失败") }
        let detail = DetailViewController()
        detail.homeContent = data
        detail.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detail, animated: true)
        
    }
}
