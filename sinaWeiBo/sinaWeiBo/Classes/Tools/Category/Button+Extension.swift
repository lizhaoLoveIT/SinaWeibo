//
//  Button+Extension.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

// extension 相当于 OC 中的分类，特点和 OC 中的分类一样
// 不能定义存储属性

extension UIButton {
    
    /**
     * 如果想给系统的类新增一个构造方法，只能新增一个便利构造方法
     * 指定构造方法： 以 init 开头
     * 便利构造方法： init 前面前面还有 convenience
     * 
     * 指定构造器：必须初始化当前类的所有属性
     * 便利构造器：不用初始化当前类的所有属性，但是它依赖于当前类的其他构造方法
     *           必须在'便利构造器'中调用'当前类'的其他'指定构造方法'
     * 
     * 1. 在开发中，不要随便定义遍历构造器，只有当需要提供一个方法快速创建对象时
     * 2. 或者在当前构造方法 中没有办法初始化所有属性时，才定义便利构造器
     *
     */
    convenience init(imageName: String, backgroundImageName: String, target: AnyObject, action: Selector) {
        
        self.init()
        // 设置图标
        setImage(UIImage(named: imageName), forState: .Normal)
        setImage(UIImage(named: imageName + "_highlighted"), forState: .Highlighted)
        
        // 设置背景
        setBackgroundImage(UIImage(named: backgroundImageName), forState: .Normal)
        setBackgroundImage(UIImage(named: backgroundImageName + "_highlighted"), forState: .Highlighted)
        
        // 调整按钮尺寸
        sizeToFit()
        
        addTarget(target, action: action, forControlEvents: .TouchUpInside)
    }
}


