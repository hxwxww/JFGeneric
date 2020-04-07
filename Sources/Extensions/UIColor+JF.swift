//
//  UIColor+JF.swift
//  JFGeneric
//
//  Created by HongXiangWen on 2020/4/7.
//  Copyright © 2020 WHX. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// rgba元组， r、g、b的范围（0 ~ 255），a的范围（0 ~ 1）
    public typealias RGBAValue = (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    
    /// r，g，b，a的值
    public var rgbaValue: RGBAValue {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red * 255, green * 255, blue * 255, alpha)
    }
    
    /// 是否是深色
    public var isDark: Bool {
        return rgbaValue.red * 0.299 + rgbaValue.green * 0.587 + rgbaValue.blue * 0.114 < 192
    }
    
    /// 16进制字符串
    public var hexString: String {
        let rgb = Int(rgbaValue.red) << 16 | Int(rgbaValue.green) << 8 | Int(rgbaValue.blue)
        return String(format: "#%06X", rgb)
    }
    
    /// 反色
    public var invert: UIColor {
        return UIColor(r: 255 - rgbaValue.red, g: 255 - rgbaValue.green, b: 255 - rgbaValue.blue)
    }
    
    /// 根据r、g、b、a生成颜色
    ///
    /// - Parameters:
    ///   - r: 红
    ///   - g: 绿
    ///   - b: 蓝
    ///   - a: 透明度
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    /// 根据16进制数hexValue生成颜色
    ///
    /// - Parameter hexValue: 16进制数
    public convenience init(hexValue: UInt64, alpha: CGFloat = 1.0) {
        let r = CGFloat((hexValue & 0xFF0000) >> 16)
        let g = CGFloat((hexValue & 0xFF00) >> 8)
        let b = CGFloat(hexValue & 0xFF)
        self.init(r: r, g: g, b: b, a: alpha)
    }
    
    /// 根据16进制字符串hexString生成颜色
    ///
    /// - Parameter hexString: 16进制字符串
    public convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let valueString = hexString.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: valueString)
        scanner.scanLocation = 0
        var hexValue: UInt64 = 0
        scanner.scanHexInt64(&hexValue)
        self.init(hexValue: hexValue, alpha: alpha)
    }
}

// MARK: -  Random Color

extension UIColor {
    
    /// 随机颜色
    ///
    /// - Returns: 颜色实例
    public static func randomColor() -> UIColor {
        return randomColor(fromValue: 0, toValue: 255)
    }
    
    /// 指定范围的随机颜色
    ///
    /// - Parameters:
    ///   - fromValue: 起始值（0 ~ 255）
    ///   - toValue: 结束值（0 ~ 255）
    /// - Returns: 颜色实例
    public static func randomColor(fromValue: CGFloat, toValue: CGFloat) -> UIColor {
        let from = max(min(fromValue, toValue), 0)
        let to = min(max(fromValue, toValue), 255)
        let delta = to - from
        if delta == 0 {
            return UIColor(r: fromValue, g: fromValue, b: fromValue)
        }
        let r: CGFloat = CGFloat(arc4random() % UInt32(delta)) + from
        let g: CGFloat = CGFloat(arc4random() % UInt32(delta)) + from
        let b: CGFloat = CGFloat(arc4random() % UInt32(delta)) + from
        return UIColor(r: r, g: g, b: b)
    }
}
