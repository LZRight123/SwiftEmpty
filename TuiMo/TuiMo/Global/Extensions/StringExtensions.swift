//
//  StringExtensions.swift
//  JZT_SUPPLIER
//
//  Created by 梁泽 on 2018/10/26.
//  Copyright © 2018 com.FBBC.JoinTown. All rights reserved.
//

import Foundation

extension String {
    public func toURL() -> NSURL? {
        return NSURL(string: self)
    }
    
    public static func randomStringWithLength (len : Int) -> String {
        
        let letters : NSString = "当有多种因素制约是否是合格体重时我们可以用多个来对该类型进行修饰每一种修饰的相关细节我们都在对应的中单独的封装起来这样就大大降低了代码的耦合度同时代码的可维护性也得到了相应的提高标准库中大部分都是用这种思想构建的"
        
        let randomString : NSMutableString = NSMutableString(capacity: len)
        
        for _ in 0 ..< len {
            let length = UInt32 (letters.length)
            let rand = arc4random_uniform(length)
            randomString.appendFormat("%C", letters.character(at: Int(rand)))
        }
        
        return String(randomString)
    }
    
    var decimal: String {
        return Double(self)?.numberFormat ?? ""
    }
    
}
