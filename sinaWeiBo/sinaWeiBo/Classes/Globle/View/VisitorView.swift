//
//  VisitorView.swift
//  sinaWeiBo
//
//  Created by 李朝 on 16/6/7.
//  Copyright © 2016年 IFengXY. All rights reserved.
//

import UIKit

protocol VisitorViewDelegate {
    /// 注册
    func visitorViewDidClickRegisterButton(visitor: VisitorView)
    /// 登录
    func visitorViewDidClickLoginButton(visitor: VisitorView)
}

class VisitorView: UIView {
    
    // MARK: -
    // MARK: 外部接口
    // MARK: -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    var deletege: VisitorViewDelegate?
    
    /// 按钮
    lazy var registerButton: UIButton = {
        return self.createButton("注册", color: UIColor.orangeColor(), backgroundImageName: "common_button_white_disable", target: self, action: #selector(registerButtonOnClick), controlEvents: UIControlEvents.TouchUpInside)
    }()
    lazy var loginButton: UIButton = {
        return self.createButton("登录", color: UIColor.lightGrayColor(), backgroundImageName: "common_button_white_disable", target: self, action: #selector(loginButtonOnClick), controlEvents: .TouchUpInside)
    }()
    
    /// 设置游客视图的属性
    func setupVisitorView(iconImageName: String, contentText: String, isHiddenTurnplate: Bool) {
        
        if isHiddenTurnplate == false { // 首页
            turnplate.hidden = false
            startTurnRoundPlate()
        } else {
            turnplate.hidden = true
        }
        
        iconImageView.image = UIImage(named: iconImageName)
        contentLabel.text = contentText
    }
    
    // MARK: -
    // MARK: UI 交互
    // MARK: -
    
    /// 点击了注册按钮
    @objc private func registerButtonOnClick() {
        deletege?.visitorViewDidClickRegisterButton(self)
    }
    
    /// 点击了登录按钮
    @objc private func loginButtonOnClick() {
        deletege?.visitorViewDidClickLoginButton(self)
    }
    
    // MARK: -
    // MARK: 懒加载子控件
    // MARK: -
    /// 1.转盘
    private lazy var turnplate = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    
    /// 2.蒙版
    private lazy var coverView = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
    
    /// 3.图标
    private lazy var iconImageView = UIImageView(image: UIImage(named: ""))
    
    /// 4.提示文本
    private lazy var contentLabel: UILabel = {
       let label = UILabel()
        label.textAlignment = .Center
        label.numberOfLines = 0
        label.textColor = UIColor.lightGrayColor()
        return label
    }()
}


// MARK: -
// MARK: 初始化 UI
// MARK: -
extension VisitorView {
    /// 初始化 UI
    private func setup() {
        
        addSubview(turnplate)
        addSubview(coverView)
        addSubview(iconImageView)
        addSubview(contentLabel)
        addSubview(registerButton)
        addSubview(loginButton)
        
        // 布局子控件
        turnplate.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        coverView.snp_makeConstraints { (make) in
            make.center.equalTo(self)
        }
        
        iconImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self).offset(16)
        }
        
        contentLabel.snp_makeConstraints { (make) in
            make.top.equalTo(turnplate.snp_bottom).offset(15)
            make.centerX.equalTo(self)
            make.width.equalTo(226)
        }
        
        registerButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentLabel.snp_bottom).offset(15)
            make.left.equalTo(contentLabel)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        loginButton.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentLabel.snp_bottom).offset(15)
            make.right.equalTo(contentLabel)
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        backgroundColor = UIColor(white: 237.0/255.0, alpha: 1.0)
    }
}


// MARK: -
// MARK: 执行动画
// MARK: -
extension VisitorView {
    
    /// 执行首页转盘动画
    private func startTurnRoundPlate() {
        // 1.创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        // 2.设置动画属性
        animation.fromValue = 0
        animation.toValue = 2 * M_PI
        animation.duration = 20
        animation.repeatCount = MAXFLOAT
        
        // 告诉系统不要移除动画
        animation.removedOnCompletion = false
        
        // 3.添加动画
        turnplate.layer.addAnimation(animation, forKey: nil)
    }
}

// MARK: -
// MARK: 工具方法
// MARK: -
extension VisitorView {
    /// 生成 button 给我 title color backgroudImage
    private func createButton(title: String, color: UIColor, backgroundImageName: String, target: AnyObject, action: Selector, controlEvents: UIControlEvents) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, forState: .Normal)
        btn.setTitleColor(color, forState: .Normal)
        btn.setBackgroundImage(UIImage(named: backgroundImageName), forState: .Normal)
        btn.addTarget(target, action: action, forControlEvents: controlEvents)
        return btn
    }
}