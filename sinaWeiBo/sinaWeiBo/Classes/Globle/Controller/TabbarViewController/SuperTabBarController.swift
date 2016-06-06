//
//  TabBarController.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/6.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

class SuperTabBarController: UITabBarController {

    /**
     * 控制器声明周期
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建 AMTabBar
        setValue(AMTabBar(), forKey: "tabBar")
        
        // 添加所有自控制器
        addChildViewControllers()
    }
}


// MARK: -
// MARK: 设置 UI
// MARK: -

extension SuperTabBarController {
    
    /**
     * 添加所有控制器
     */
    private func addChildViewControllers() {
        
        // 从 resource 中加载 json
        
        // 1.获取 json 文件路径
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)!
        
        // 2.加载 Json文件
        let data = NSData(contentsOfFile: path)!
        // 3.将 Json 文件加载进来的数据转换为对象 字典数组
        guard let objc = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) else {
            addChildViewController("HomeRootViewController", title: "首页", imageName: "tabbar_home")
            addChildViewController("MessageRootViewController", title: "发现", imageName: "tabbar_discover")
            addChildViewController("DiscoverRootViewController", title: "消息", imageName: "tabbar_message_center")
            addChildViewController("ProfileRootViewController", title: "我", imageName: "tabbar_profile")
            
            return
        }
        
        // 4.遍历字典数组，取出对应的值
        guard let array = objc as? [[String: AnyObject]] else {
            return
        }
        
        for dict in array {
            addChildViewController(dict["vcName"] as? String, title: dict["title"] as? String, imageName: dict["imageName"] as? String)
        }
        
        
    }
    /**
     * 添加单独控制器
     */
    private func addChildViewController(childControllerName: String?, title: String?, imageName: String?) {
        
        // 动态获取命名空间
        guard let workSpaceName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as? String else {
            return
        }
        
        // 拼接字符串
        let className = workSpaceName + "." + (childControllerName ?? "")
        
        // 通过字符串创建类(创建后类型为 anyClass)，需要转成我们需要的类型然后使用
        guard let cls = NSClassFromString(className) as? UIViewController.Type else {
            return
        }
        
        let childController = cls.init()
        childController.title = title
        
        if let name = imageName where name != "" {
            childController.tabBarItem.image = UIImage(named: name)
            childController.tabBarItem.selectedImage = UIImage(named: name + "_highlighted")
        }
        
        let nav = SuperNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
}
