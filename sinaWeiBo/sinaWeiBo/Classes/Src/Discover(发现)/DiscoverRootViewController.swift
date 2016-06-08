//
//  DiscoverRootViewController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class DiscoverRootViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.初始化游客模式
        setupVisitorModel("visitordiscover_image_message", contentText: "登录后，最新、最热微博尽在掌握，不再会与实事潮流擦肩而过", isHiddenTurnplate: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        showOrHiddenVisitorView(view)
    }
}
