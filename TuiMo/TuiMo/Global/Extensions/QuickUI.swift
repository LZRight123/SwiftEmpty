//
//  QuickUI.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/25.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import UIKit

extension UIView {
    static func create(color: UIColor = .white) -> UIView {
        return UIView(color: color)
    }
    
    convenience init(color: UIColor){
        self.init()
        self.backgroundColor = color
    }
    
    func addSubviews(_ subViews: UIView...) {
        subViews.forEach(addSubview)
    }
}

extension CALayer {
    static func create(color: UIColor = .white) -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = color.cgColor
        return layer
    }
}


extension UILabel {
    static func create(font: UIFont = .font14, textColor: UIColor = .hex222222, text: String? = "") -> UILabel {
        return UILabel(font: font, textColor: textColor, text: text)
    }
    
    convenience init(font: UIFont = .font14, textColor: UIColor = .hex222222, text: String? = "", numberOfLines: Int = 1) {
        self.init()
        self.font = font
        self.textColor = textColor
        self.text = text
        self.numberOfLines = numberOfLines
    }
}


extension UIButton {
    static func create(font: UIFont, title: String, titleColor: UIColor, image: UIImage?) -> UIButton {
        let btn = UIButton()
        btn.titleLabel?.font = font
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setImage(image, for: .normal)
        return btn
    }
    
    convenience init(font: UIFont, title: String, titleColor: UIColor, image: UIImage? = nil) {
        self.init()
        titleLabel?.font = font
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        setImage(image, for: .normal)
    }
}


extension UITableView {
    static func create(style: UITableView.Style = .plain, backgroundColor: UIColor = .beijinghui, separatorStyle: UITableViewCell.SeparatorStyle = .none) -> UITableView {
//        let tableView = UITableView(frame: .zero, style: style)
//        tableView.backgroundColor = backgroundColor
//        tableView.estimatedRowHeight = 99.9
//        tableView.separatorStyle = separatorStyle
//        tableView.keyboardDismissMode = .onDrag
        return UITableView(style: style, backgroundColor: backgroundColor, separatorStyle: separatorStyle)
    }
    
    convenience init(style: UITableView.Style = .plain, backgroundColor: UIColor = .beijinghui, separatorStyle: UITableViewCell.SeparatorStyle = .none) {
        self.init(frame: .zero, style: style)
        self.backgroundColor = backgroundColor
        estimatedRowHeight = 99.9
        estimatedSectionHeaderHeight = 0
        estimatedSectionFooterHeight = 0
        self.separatorStyle = separatorStyle
        keyboardDismissMode = .onDrag
    }
}

extension UICollectionView {
    static func create(scrollDirection: UICollectionView.ScrollDirection, userInteractionEnabled: Bool, backgroundColor: UIColor = .clear ,interitemSpacing: CGFloat = 0.0, lineSpacing: CGFloat = 0.0) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = interitemSpacing
        layout.minimumLineSpacing = lineSpacing
        layout.scrollDirection = scrollDirection
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.scrollsToTop = false
        view.isUserInteractionEnabled = userInteractionEnabled
        view.backgroundColor = backgroundColor
        return view
    }
}
