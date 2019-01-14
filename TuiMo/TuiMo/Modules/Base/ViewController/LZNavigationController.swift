//
//  LZNavigationController.swift
//  TuiMo
//
//  Created by 梁泽 on 2019/1/14.
//  Copyright © 2019 梁泽. All rights reserved.
//

import UIKit

class LZNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = UINavigationBar.appearance()
        navBar.tintColor = .white
        navBar.setBackgroundImage(UIImage.image(withColor: .white, size: CGSize(width: ScreenWidth, height: StatusBarH + NavBarH)), for: .default)
        navBar.shadowImage = UIImage.image(withColor: .beijinghui, size: CGSize(width: ScreenWidth, height: 1))
        
        navBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.black,
            NSAttributedString.Key.font : UIFont.font20
        ]
        
        UIBarButtonItem.appearance().setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor : UIColor.main,
            .font : UIFont.font18
            ], for: .normal)
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard viewControllers.count > 0 else {
            super.pushViewController(viewController, animated: animated)
            return
        }
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: #selector(clickBackItem))
    }
    
    @objc private func clickBackItem() {
        popViewController(animated: true)
    }
}
