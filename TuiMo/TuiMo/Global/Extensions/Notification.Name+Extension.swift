//
//  Notification.Name+Extension.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/12/28.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let JZTOrderDetailStatusChange = Notification.Name("JZTOrderDetailStatusChange")
}

extension Notification {
    enum JZT {
        static var login = Name("loginjzt")
    }
    
    struct JZTTest {
        static let pre = "JZTTest"
        static let login = Name(pre + "JZTTest")
    }
}
