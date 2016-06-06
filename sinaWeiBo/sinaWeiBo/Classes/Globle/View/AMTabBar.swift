//
//  AMTabBar.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class AMTabBar: UITabBar {
    
    /**
     * 初始化设置
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     * 点击了 加号 按钮
     */
    func composeButtonClick() {
        AMLog("点击了加号")
    }
    
    // MARK: -
    // MARK: 懒加载
    // MARK: -
    
    /**
     * 中间加好按钮
     */
    private lazy var composeButton: UIButton = {
        let btn = UIButton(imageName: "tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button", target: self, action: #selector(composeButtonClick))
        return btn
    }()
}

// MARK: -
// MARK: 初始化设置
// MARK: -

extension AMTabBar {
    private func setup() {
        
//        UITabBar.appearance().tintColor = UIColor.orangeColor()
        // 设置tabBar的背景颜色
//        backgroundImage = UIImage(named: "")
        
        // 创建文字属性字典 一般状态下
        var attrDict = [String: AnyObject]()
        attrDict[NSForegroundColorAttributeName] = UIColor.lightGrayColor()
        attrDict[NSFontAttributeName] = UIFont.systemFontOfSize(12)
        
        // 创建文字属性 选中状态下
        var attrSelectedDict = [String: AnyObject]()
        attrSelectedDict[NSForegroundColorAttributeName] = UIColor.orangeColor()
        attrDict[NSFontAttributeName] = UIFont.systemFontOfSize(12)
        
        // 设置文字属性
        let tabBarItem = UITabBarItem.appearance()
        tabBarItem.setTitleTextAttributes(attrDict, forState: .Normal)
        tabBarItem.setTitleTextAttributes(attrSelectedDict, forState: .Selected)
        
        // 设置 tabBar 中间按钮
        addSubview(composeButton)
    }
}


// MARK: -
// MARK: 布局子控件
// MARK: -

extension AMTabBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var index = 0
        var tabBarItemX: CGFloat = 0
        let tabBarItemY: CGFloat = 0
        
        let tabBarItemWidth: CGFloat = width * 0.2
        let tabBarItemHeight: CGFloat = height
        
        // 设置中间按钮的 frame
        composeButton.frame.size = CGSizeMake(tabBarItemWidth, tabBarItemHeight)
        composeButton.center = CGPointMake(width * 0.5, height * 0.5)
        
        for tabBarItem in subviews {
            // 排除 composeButton 的干扰
            if tabBarItem == composeButton || !tabBarItem.isKindOfClass(UIControl.self) {
                continue;
            }
            tabBarItemX = tabBarItemWidth * CGFloat(((index > 1) ? (index + 1) : index))
            tabBarItem.frame = CGRectMake(tabBarItemX, tabBarItemY, tabBarItemWidth, tabBarItemHeight)
            index += 1
        }
    }
}











