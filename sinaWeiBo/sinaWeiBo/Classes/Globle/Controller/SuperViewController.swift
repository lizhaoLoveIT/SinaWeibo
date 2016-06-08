//
//  AMSuperViewController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {
    
    // MARK: -
    // MARK: 属性
    // MARK: -
    
    /// 用户是否登录
    var userLogin: Bool = false
    /// 标记当前控制器界面是否是登录状态
    var loginStatus: Bool = false
    
    /// 访客视图
    lazy var visitorView: VisitorView = VisitorView()
    
}

// MARK: -
// MARK: 游客模式
// MARK: -
extension SuperViewController {
    
    /// 初始化游客模式
    func setupVisitorModel(iconImageName: String, contentText: String, isHiddenTurnplate: Bool) {
        // 1. 添加游客视图
        view.addSubview(visitorView)
        // 2. 设置游客视图
        visitorView.setupVisitorView(iconImageName, contentText: contentText, isHiddenTurnplate: isHiddenTurnplate)
        // 3.设置位置
        visitorView.snp_makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        visitorView.deletege = self
    }
    
    /// 根据用户登录情况，展示不同视图 参数:传入需要隐藏的 view
    func showOrHiddenVisitorView(view: UIView) {
        
        if userLogin == true && loginStatus == false {                // 用户登录了 当前控制器不是登录状态(展示 tableView)
            loginStatus = true
            
            visitorView.hidden = true // 隐藏游客 view
            view.hidden = false // 展示 tableView
            
        } else if userLogin == false && loginStatus == true {         // 当前控制器是登录状态  但用户没有登录(展示游客界面)
            loginStatus = false
            
            visitorView.hidden = false // 展示游客 view
            view.hidden = true // 隐藏 tableView
        }
    }
}

// MARK: -
// MARK: 弹出登录和注册控制器
// MARK: -
extension SuperViewController {
    
    /// 弹出注册控制器
    func presentRegisterViewController() {
        AMLog("弹出注册控制器")
    }
    
    /// 弹出登录控制器
    func presentLoginViewController() {
        AMLog("弹出登录控制器")
    }
}

// MARK: -
// MARK: VisitorViewDelegate
// MARK: -
extension SuperViewController: VisitorViewDelegate {
    
    func visitorViewDidClickRegisterButton(visitor: VisitorView) {
        AMLog("点击了注册按钮")
    }
    
    func visitorViewDidClickLoginButton(visitor: VisitorView) {
        AMLog("点击了登录按钮")
    }
    
}