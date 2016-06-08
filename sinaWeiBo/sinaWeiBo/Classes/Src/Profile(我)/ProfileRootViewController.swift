//
//  ProfileRootViewController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class ProfileRootViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.初始化游客模式
        setupVisitorModel("visitordiscover_image_profile", contentText: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人", isHiddenTurnplate: true)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        showOrHiddenVisitorView(view)
    }

}
