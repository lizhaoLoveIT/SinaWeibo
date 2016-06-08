//
//  MessageRootViewController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class MessageRootViewController: SuperViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.初始化游客模式
        setupVisitorModel("visitordiscover_image_message", contentText: "登录后，别人评论你的微博，发给你的消息，都会在这里收到通知", isHiddenTurnplate: true)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        showOrHiddenVisitorView(view)
    }

}
