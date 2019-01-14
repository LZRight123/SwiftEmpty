//
//  File.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/11/17.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation

extension UserDefaults {
    enum CustomSave: String, LZUserDefaultsSettable {
        case name
    }
    
    func testusing() {
        UserDefaults.CustomSave.name.store( "hello");
        let _ = UserDefaults.CustomSave.name.storedValue
        
    }
}


public protocol LZUserDefaultsSettable {
    var uniqueKey: String { get }
    
}


public extension LZUserDefaultsSettable where Self: RawRepresentable {
    public var uniqueKey: String {
        return "\(Self.self).\(rawValue)"
    }
    
    public func store(_ value: Any?) {
        UserDefaults.standard.set(value, forKey: uniqueKey)
    }
    
    public var storedValue: Any? {
        return UserDefaults.standard.value(forKey: uniqueKey)
    }
    
    //    public func store(_ value: Bool) {
    //        UserDefaults.standard.set(value, forKey: uniqueKey)
    //    }
    //
    //    public var storedBool: Bool {
    //        return UserDefaults.standard.bool(forKey: uniqueKey)
    //    }
    // 还有支持其他存储类型的函数，可写可不写
}
