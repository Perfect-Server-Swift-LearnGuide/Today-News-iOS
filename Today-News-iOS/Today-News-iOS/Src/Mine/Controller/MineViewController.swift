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
    
    var user = User()
    
    // 未登录
    fileprivate lazy var noLoginHeaderView: MineNoLoginHeaderView = {
        let noLoginHeaderView = MineNoLoginHeaderView.createFromNib()
        noLoginHeaderView?.delegate = self
        return noLoginHeaderView!
    }()
    
    // 已登录
    fileprivate lazy var loginHeaderView: MineLoginHeaderView = {
        let loginHeaderView = MineLoginHeaderView.createFromNib()
        return loginHeaderView!
    }()
    
    
    lazy var datas: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = User.realm.objects(User.self).first {
            self.user = u
        }
    
        setupUI()
        
        setupTableView()

        loadData()
        
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        tableView.tableHeaderView?.height = 163
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
        DataManager.dataFromSource(source: .UserTab, loadFinished: {(response) in
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

// MARK: - setup ui
extension MineViewController {
    
    func setupUI() {
        view.backgroundColor = App.Color.MainBgGray.color
        self.automaticallyAdjustsScrollViewInsets = true
    }
    
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: MineCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineCell.self))
        tableView.register(UINib(nibName: String(describing: MineActionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MineActionCell.self))
        
        tableView.tableHeaderView = self.user.user_id.characters.count > 0 ? loginHeaderView : noLoginHeaderView
        tableView.separatorColor = App.Color.MainTableSepGray.color
        tableView.tableFooterView = UIView()
    }
}

// MARK: - tableView dataSource
extension MineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return datas.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {return 1}
        guard let rows = datas[section - 1] as? [MineCellModel] else {
            return 0
        }
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MineActionCell.self), for: indexPath) as? ViewConfigurable else { fatalError("无法构建 Cell") }
            
            return cell as? UITableViewCell ?? UITableViewCell()
        }
        
        guard let rows = datas[indexPath.section - 1] as? [AnyObject], let data = rows[indexPath.row] as? MineCellModel,  let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MineCell.self), for: indexPath) as? ViewConfigurable else { fatalError("无法构建 Cell") }
        
        cell.viewSourceWithModel!(data , indexPath: indexPath as IndexPath)
        
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 60
        }
        return 40
    }
    
}

// MARK: - tableView delegate
extension MineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.1
        }
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
            let headerviewHeight: CGFloat = 163.0
            let screenWidth = UIScreen.main.bounds.width
            let totalOffset = headerviewHeight + abs(offsetY)
            let f = totalOffset / headerviewHeight
            let rect = CGRect(x: -screenWidth * (f - 1) * 0.5, y: offsetY, width: screenWidth * f, height: totalOffset)
            user.user_id.characters.count > 0 ? (loginHeaderView.bgImageView.frame = rect) : (noLoginHeaderView.bgImageView.frame = rect)
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
