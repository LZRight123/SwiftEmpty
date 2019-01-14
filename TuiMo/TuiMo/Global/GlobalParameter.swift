//
//  GlobalParameter.swift
//  LearningSwift
//
//  Created by 梁泽 on 2018/9/14.
//  Copyright © 2018年 梁泽. All rights reserved.
//

import UIKit

let ScreenWidth  = UIScreen.main.bounds.width
let ScreenHeight = UIScreen.main.bounds.height
let StatusBarH   = UIApplication.shared.statusBarFrame.height
let NavBarH: CGFloat = 44
let ISIphoneX  = (StatusBarH == 44)
let SafeBottomArea: CGFloat = (ISIphoneX ? 34 : 0)
let ScaleW = ScreenWidth/375.0
let TagCommont = 100

func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line)  {
    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line),\(method): \(message)]")
    #endif
}

func objectAddress(_ object:AnyObject) -> UnsafeMutableRawPointer{
    return Unmanaged.passUnretained(object).toOpaque()
}

func printValueTypeAdress<T>(_ value: inout T)  {
//    withUnsafePointer(to: &value) { print("\(value) is \($0)") }
}

extension Date: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "YYYY-MM-dd"
        guard let date = dateformatter.date(from: value) else {
            preconditionFailure("This date: \(value) is not invalid")
        }
        self = date
    }
}

extension CGSize {
    static func *(lhs: CGSize, rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
}

protocol NumberProtocol{
    var doubleValue: Double { get }
    var intValue: Int { get }
    var cgFloatValue: CGFloat { get }
}
extension NumberProtocol{
    var doubleValue: Double {
        if let value = self as? Int{
            return Double(value)
        } else if let value = self as? Double{
            return Double(value)
        } else if let value = self as? CGFloat{
            return Double(value)
        }
        return Double(0)
    }
    var intValue: Int {
        if let value = self as? Int{
            return Int(value)
        } else if let value = self as? Double{
            return Int(value)
        } else if let value = self as? CGFloat{
            return Int(value)
        }
        return Int(0)
    }
    var cgFloatValue: CGFloat{
        if let value = self as? Int{
            return CGFloat(value)
        } else if let value = self as? Double{
            return CGFloat(value)
        } else if let value = self as? CGFloat{
            return CGFloat(value)
        }
        return CGFloat(0)
    }
}
extension Int: NumberProtocol{ }
extension Double: NumberProtocol{ }
extension CGFloat: NumberProtocol{ }
extension String: NumberProtocol{
    var doubleValue: Double {
        return Double(self) ?? 0
    }
}
