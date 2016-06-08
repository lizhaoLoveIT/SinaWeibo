//
//  AppDelegate.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/3.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit
import QorumLogs

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    override class func initialize() {
        setupAppearance()
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        QorumLogs.minimumLogLevelShown = 1
//        QorumLogs.onlyShowThisFile(ViewController)
        QorumLogs.enabled = true
//        QL1(1) // debug
//        QL2(2) // info
//        QL3(3) // warning
//        QL4(4) // error
//        QLPlusLine()
//        QLShortLine()
        
        // 1.创建 window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        // 2.设置 window.rootVc
        window?.rootViewController = TabBarController()
        
        // 3.显示 window
        window?.makeKeyAndVisible()
        
        // 设置全局属性
        setupAppearance()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

/**
 * 全局函数，自定义 Log
 * swift 3  #file = __FILE__
 *          #function = __FUNCTION__
 *          #line = __LINE__
 * 泛型函数，泛型可以实现调用者传递什么类型就是什么类型
 */
func AMLog<T>(message: T,
              file: String = #file,
            method: String = #function,
            line: Int = #line ) {
    #if AM_DEBUG
    // 1.处理文件名称
    let fileName = (file as NSString).pathComponents.last!
    
    // 2.按照指定格式数据日志 文件名称-方法名称[行号]：输出内容
    print("\(fileName)-\(method)[\(line)]:\(message)")
    #endif
}


/**
 * 设置全局属性
 */
func setupAppearance() {
    
}