//
//  LZTabBarController.swift
//  TuiMo
//
//  Created by 梁泽 on 2019/1/14.
//  Copyright © 2019 梁泽. All rights reserved.
//

import UIKit

class LZTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([ .foregroundColor : UIColor.hex444444, .font : UIFont.font13 ], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([ .foregroundColor  : UIColor.main], for: .selected)
   
        configSubController()
    }
}

extension LZTabBarController {
    fileprivate func configSubController() {
        var vcs = [UIViewController]()
        for childVC in rootViewControllers {
            let navVC = LZNavigationController(rootViewController: childVC)
            vcs.append(navVC)
        }
        viewControllers = vcs
    }
    
    var rootViewControllers: [UIViewController] {
        let home1 = HomeVC()
        home1.title = "首页"
        home1.tabBarItem.image = UIImage(named: "tabbar_icon_home_weixuanzhong")?.withRenderingMode(.alwaysOriginal)
        home1.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_home_xuanzhong")?.withRenderingMode(.alwaysOriginal)
        
        let home2 = SecondVC()
        home2.title = "Sec"
        home2.tabBarItem.image = UIImage(named: "tabbar_icon_dingyue_weixuanzhong")?.withRenderingMode(.alwaysOriginal)
        home2.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_dingyue_xuanzhong")?.withRenderingMode(.alwaysOriginal)
        
        let home3 = ThirdVC()
        home3.title = "Thir"
        home3.tabBarItem.image = UIImage(named: "tabbar_icon_xiazai_weixuanzhong")?.withRenderingMode(.alwaysOriginal)
        home3.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_xiazai_xuanzhong")?.withRenderingMode(.alwaysOriginal)
        
        let home4 = MyVC()
        home4.title = "我的"
        home4.tabBarItem.image = UIImage(named: "tabbar_icon_wode_weixuanzhong")?.withRenderingMode(.alwaysOriginal)
        home4.tabBarItem.selectedImage = UIImage(named: "tabbar_icon_wode_xuanzhong")?.withRenderingMode(.alwaysOriginal)
        
        return [home1, home2, home3, home4]
    }
}
