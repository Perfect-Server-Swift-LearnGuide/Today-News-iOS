//
//  TopicPageViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/20.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit
import UITableView_FDTemplateLayoutCell

class TopicPageViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    /// 文章内容
    lazy var contents = NSMutableArray()
    
    /// 文章类型
    public var type = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DataManager.dataFromSource(source: .HomeCategoryContent(params: ["type" : "\(self.type)"]), loadFinished: { (response) in
            
            if let data = response as? [String: AnyObject], let json = data["data"] {
                self.contents = HomeContent.mj_objectArray(withKeyValuesArray: json)
                self.tableView.reloadData()
            }
        })
        
        automaticallyAdjustsScrollViewInsets = false
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 49, right: 0)
        tableView.register(HomeTopicViewCell.classForCoder(), forCellReuseIdentifier: String(describing: HomeTopicViewCell.self))
        
        tableView.tableFooterView = UIView()
    }


}

//MARK: - tableView dataSource
extension TopicPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTopicViewCell.self), for: indexPath) as? ViewConfigurable else { fatalError("无法构建 Cell") }
        cell.viewSourceWithModel!(contents[indexPath.row] as AnyObject?, indexPath: indexPath as IndexPath)
        
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
//        guard let data = contents[indexPath.row] as AnyObject? else { fatalError("解析数据失败") }
//        return tableView.fd_heightForCell(withIdentifier: data.identifier, cacheBy: indexPath) { cell in
//            if let cell = cell as? ViewConfigurable {
//                cell.viewSourceWithModel!(data, indexPath: indexPath as IndexPath)
//            }
//        }

    }
    
}

//MARK: - tableView delegate
extension TopicPageViewController: UITableViewDelegate {
    
}
