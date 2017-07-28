//
//  MineViewController.swift
//  Today-News-iOS
//
//  Created by Mac on 17/7/19.
//  Copyright © 2017年 lovemo. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 头部视图
    fileprivate lazy var noLoginHeaderView: MineNoLoginHeaderView = {
        let noLoginHeaderView = MineNoLoginHeaderView.headerView()
        noLoginHeaderView.delegate = self
        return noLoginHeaderView
    }()
    
    lazy var datas: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setupTableView()

        loadData()
        
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        noLoginHeaderView.height = UIScreen.main.bounds.height * 0.4
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}

// MARK: - data
extension MineViewController {
    func loadData() {
        DataManager.dataFromSource(source: .UserTabs, loadFinished: {(response) in
            if let data = response as? [String: AnyObject], let json = data["data"], let sections = json["sections"] as? [Any] {
                for section in sections {
                    if let sec = section as? [AnyObject] {
                        let models = MineCellModel.mj_objectArray(withKeyValuesArray: sec) as [AnyObject]
                        self.datas.add(models)
                    }
                }
                self.tableView.reloadData()
            }
            
        })
    }
}

// MARK: - setup TableView
extension MineViewController {
    
    func setupUI() {
        view.backgroundColor = App.Color.MainBgGray.color
        self.automaticallyAdjustsScrollViewInsets = true
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: MineCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineCell.self))
        tableView.tableHeaderView = noLoginHeaderView
        tableView.separatorColor = App.Color.MainTableSepGray.color
        tableView.tableFooterView = UIView()
    }
}
// MARK: - tableView dataSource
extension MineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = datas[section] as? [MineCellModel] else {
            return 0
        }
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let rows = datas[indexPath.section] as? [AnyObject], let data = rows[indexPath.row] as? MineCellModel,  let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MineCell.self), for: indexPath) as? ViewConfigurable else { fatalError("无法构建 Cell") }
        
        cell.viewSourceWithModel!(data , indexPath: indexPath as IndexPath)
        
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
}

// MARK: - tableView delegate
extension MineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.width, height: 10))
        view.backgroundColor = App.Color.MainBgGray.color
        return view
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        if offsetY < 0 {
            let headerviewHeight = UIScreen.main.bounds.height * 0.38
            let screenWidth = UIScreen.main.bounds.width
            let totalOffset = headerviewHeight + abs(offsetY)
            let f = totalOffset / headerviewHeight
            noLoginHeaderView.bgImageView.frame = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
        }
    }
}

// MARK: - NoLoginHeaderViewDelegate 未登录界面代理
extension MineViewController: NoLoginHeaderViewDelegate {
    /// 更多登录方式按钮点击
    func moreLoginButotnClicked() {
        let moreLoginVC = MoreLoginViewController()
        moreLoginVC.modalPresentationStyle = .custom
        moreLoginVC.transitioningDelegate = Transition.shareManager()
        present(moreLoginVC, animated: true, completion: nil)
    }
}
