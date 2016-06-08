//
//  HomeRootViewController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class HomeRootViewController: SuperTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.初始化游客模式
        setupVisitorModel("visitordiscover_feed_image_house", contentText: "关注一些人, 回这里看看有没有什么惊喜", isHiddenTurnplate: false)
        tableView.hidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        showOrHiddenVisitorView(tableView)
    }
}



// MARK: -
// MARK: 登录模式
// MARK: -
extension HomeRootViewController {
    
    
}


// MARK: -
// MARK: VisitorViewDelegate
// MARK: -
extension HomeRootViewController {
    
    override func visitorViewDidClickRegisterButton(visitor: VisitorView) {
        
        presentRegisterViewController()
    }
    
    override func visitorViewDidClickLoginButton(visitor: VisitorView) {
        
        presentLoginViewController()
    }
    
}