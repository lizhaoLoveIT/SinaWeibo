//
//  SuperTableViewController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/7.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class SuperTableViewController: SuperViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
    }
    
    // MARK: -
    // MARK: 懒加载
    // MARK: -
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
}

// MARK: -
// MARK: UITableViewDelegate && UITableViewDataSource
// MARK: -
extension SuperTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        return tableViewCell
    }
}

// MARK: -
// MARK: 初始化 tableView
// MARK: -
extension SuperTableViewController {
    
    /// 初始化 tableView
    private func setupTableView() {
        view.addSubview(tableView)

        // 布局 tableView
        tableView .snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
    }
}





