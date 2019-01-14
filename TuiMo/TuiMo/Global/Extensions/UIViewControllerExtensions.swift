//
//  UIViewControllerExtensions.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/24.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit
//MARK:- 转场动画
extension UIViewController {
    func setupTransitioningAnimate(_ animator: UIViewControllerTransitioningDelegate) {
        modalPresentationStyle = .custom
        transitioningDelegate = animator
    }
}

//MARK:- add remove
extension UIViewController {
    @discardableResult
    func add(_ child: UIViewController) -> UIViewController {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
        return child
    }
    
    func add(_ childs: UIViewController...) {
        childs.forEach { (child) in
            add(child)
        }
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}

//MARK:- 获取当前vc
extension UIViewController {
    static func currectController() -> UIViewController {
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        return UIViewController.getCurrentController(rootVC)
    }
    
    static func getCurrentController(_ root: UIViewController?) -> UIViewController {
        guard let rootVC = root else {
            return UIViewController()
        }
        
        if let presentedVC = rootVC.presentedViewController {
            return presentedVC
        }
        
        if rootVC.isKind(of: UITabBarController.self) {
            let tabBarVC = rootVC as! UITabBarController
            return UIViewController.getCurrentController(tabBarVC.selectedViewController)
        }else if rootVC.isKind(of: UINavigationController.self) {
            let navigationVC = rootVC as! UINavigationController
            return UIViewController.getCurrentController(navigationVC.visibleViewController)
        }else {
            return rootVC
        }
    }
}


